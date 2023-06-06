<?php

namespace app\modules\productos\controllers;

use app\controllers\CoreController;
use app\models\Bitacora;
use app\modules\productos\models\Productos;
use app\modules\productos\models\ProductosImagenes;
use app\modules\productos\models\ProductosSearch;
use Exception;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\BaseFileHelper;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\helpers\Url;
use yii\web\UploadedFile;
use yurkinx\yii2image\image;

/**
 * ProductosController implements the CRUD actions for Productos model.
 */
class ProductosController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::class,
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Productos models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ProductosSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Productos model.
     * @param int $id_producto Id Producto
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_producto)
    {
        $imagenPrincipal = ProductosImagenes::find()->where(['id_producto' => $id_producto, 'principal' => 1])->exists();

        return $this->render('view', [
            'model' => $this->findModel($id_producto),
            'imagenPrincipal' => $imagenPrincipal
        ]);
    }

    /**
     * Creates a new Productos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Productos();

        if ($model->load($this->request->post())) {
            $this->Uploads(false);
            $transaction = Yii::$app->db->beginTransaction();
            try {
                if (!$model->save()) {
                    throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0, false)));
                }

                $data_original = Json::encode($model->getAttributes(), JSON_PRETTY_PRINT);

                $bitacora = new Bitacora();
                $bitacora->id_registro = $model->id_producto;
                $bitacora->controlador = $controller = Yii::$app->controller->id;
                $bitacora->accion = Yii::$app->controller->action->id;
                $bitacora->data_original = $data_original;
                $bitacora->data_modificada = NULL;
                $bitacora->id_usuario = Yii::$app->user->identity->id;
                $bitacora->fecha = $model->fecha_mod;

                if (!$bitacora->save()) {
                    throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($bitacora->getErrors(), 0, false)));
                }

                $transaction->commit();
            } catch (Exception $e) {
                $transaction->rollBack();
                $controller = Yii::$app->controller->id . "/" . Yii::$app->controller->action->id;
                CoreController::getErrorLog(\Yii::$app->user->identity->id, $e, $controller);
                return $this->redirect(['index']);
            }

            Yii::$app->session->setFlash('success', "Registro creado exitosamente.");
            return $this->redirect(['view', 'id_producto' => $model->id_producto]);
        } else {
            return $this->render('create', ['model' => $model,]);
        }
    }

    /**
     * Updates an existing Productos model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_producto Id Producto
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_producto)
    {
        $model = $this->findModel($id_producto);

        list($initialPreviewExtras, $initialPreviewConfigExtras) = $this->getInitialPreviewExtras($model->id_producto);
        list($initialPreviewPrincipal, $initialPreviewConfigPrincipal) = $this->getInitialPreviewPrincipal($model->id_producto);

        if ($model->load($this->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $data_original = Json::encode($model->getOldAttributes(), JSON_PRETTY_PRINT);
                $data_modificada = Json::encode($model->getDirtyAttributes(), JSON_PRETTY_PRINT);

                if (!$model->save()) {
                    throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0, false)));
                }

                $bitacora = new Bitacora();
                $bitacora->id_registro = $model->id_producto;
                $bitacora->controlador = $controller = Yii::$app->controller->id;
                $bitacora->accion = Yii::$app->controller->action->id;
                $bitacora->data_original = $data_original;
                $bitacora->data_modificada = $data_modificada;
                $bitacora->id_usuario = Yii::$app->user->identity->id;
                $bitacora->fecha = $model->fecha_mod;

                if (!$bitacora->save()) {
                    throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($bitacora->getErrors(), 0, false)));
                }

                $transaction->commit();
            } catch (Exception $e) {
                $transaction->rollBack();
                $controller = Yii::$app->controller->id . "/" . Yii::$app->controller->action->id;
                CoreController::getErrorLog(\Yii::$app->user->identity->id, $e, $controller);
                return $this->redirect(['index']);
            }
            Yii::$app->session->setFlash('success', "Registro actualizado exitosamente.");
            return $this->redirect(['view', 'id_producto' => $model->id_producto]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'initialPreviewExtras' => $initialPreviewExtras,
                'initialPreviewPrincipal' => $initialPreviewPrincipal,
                'initialPreviewConfigExtras' => $initialPreviewConfigExtras,
                'initialPreviewConfigPrincipal' => $initialPreviewConfigPrincipal
            ]);
        }
    }

    /**
     * Deletes an existing Productos model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_producto Id Producto
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_producto)
    {
        $model = $this->findModel($id_producto);
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model->estado = 0;
            $data_original = Json::encode($model->getOldAttributes(), JSON_PRETTY_PRINT);
            $data_modificada = Json::encode($model->getDirtyAttributes(), JSON_PRETTY_PRINT);

            if (!$model->save()) {
                throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0, false)));
            }

            $bitacora = new Bitacora();
            $bitacora->id_registro = $model->id_producto;
            $bitacora->controlador = $controller = Yii::$app->controller->id;
            $bitacora->accion = Yii::$app->controller->action->id;
            $bitacora->data_original = $data_original;
            $bitacora->data_modificada = $data_modificada;
            $bitacora->id_usuario = Yii::$app->user->identity->id;
            $bitacora->fecha = $model->fecha_mod;

            if (!$bitacora->save()) {
                throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($bitacora->getErrors(), 0, false)));
            }

            $transaction->commit();
        } catch (Exception $e) {
            $transaction->rollBack();
            $controller = Yii::$app->controller->id . "/" . Yii::$app->controller->action->id;
            CoreController::getErrorLog(\Yii::$app->user->identity->id, $e, $controller);
            return $this->redirect(['index']);
        }
        Yii::$app->session->setFlash('danger', "Registro actualizado exitosamente.");
        return $this->redirect(['index']);
    }

    /*******************
     * UPLOAD POR AJAX *
     *******************/

    public function actionUploadAjax()
    {
        $this->Uploads(true);
    }

    public function Uploads($isAjax = false)
    {
        if (Yii::$app->request->isPost) {
            $imagen_principal = UploadedFile::getInstanceByName('upload_ajax_principal');
            $imagen_extra = UploadedFile::getInstancesByName('upload_ajax_imagenes');

            if ($imagen_principal) { //? Manipulacion de una imagen
                $id = Yii::$app->request->post('id');

                $imagenPrincipal = ProductosImagenes::find()->where(['id_producto' => $id, 'principal' => 1])->exists();

                if ($imagenPrincipal) {
                    echo json_encode([
                        'success' => 'false',
                        'error' => 'Solo puede colocarse una imagen como principal. Borre la actual e intentelo de nuevo',
                    ]);
                } else {
                    $this->crearCarpeta($id);
                    $nombre = md5($imagen_principal->baseName . time()) . '.' . $imagen_principal->extension;
                    $ruta = Productos::UPLOAD_FOLDER . '/' . $id . '/' . $nombre;

                    if ($imagen_principal->saveAs($ruta)) {
                        $this->crearThumbnail($id, $nombre);

                        $model = new ProductosImagenes();
                        $model->id_producto = $id;
                        $model->imagen = $nombre;
                        $model->fecha_ing = date('Y-m-d H:i:s');
                        $model->id_usuario_ing = \Yii::$app->user->identity->id;
                        $model->principal = 1;
                        $model->save();

                        list($initialPreview, $initialPreviewConfig) = $this->getInitialPreviewAsync($model->id_producto_imagen);

                        if ($isAjax === true) {
                            echo json_encode([
                                'success' => 'true',
                                'initialPreview' => $initialPreview,
                                'initialPreviewConfig' => $initialPreviewConfig
                            ]);
                        }
                    } else {
                        if ($isAjax === true) {
                            echo json_encode(['success' => 'false', 'error' => $imagen_principal->error]);
                        }
                    }
                }
            } else { //? Manipulacion de varias imagenes
                $id = Yii::$app->request->post('id');
                $count = ProductosImagenes::find()->where(['id_producto' => $id, 'principal' => 0])->count();

                if ($count >= 5) {
                    echo json_encode([
                        'success' => 'false',
                        'error' => 'Solo puede subir un maximo de 5 imagenes. Borre la actual e intentelo de nuevo. ',
                    ]);
                } else {
                    $this->crearCarpeta($id);
                    foreach ($imagen_extra as $imagen) {
                        $nombre = md5($imagen->baseName . time()) . '.' . $imagen->extension;
                        $ruta = Productos::UPLOAD_FOLDER . '/' . $id . '/' . $nombre;

                        if ($imagen->saveAs($ruta)) {
                            $this->crearThumbnail($id, $nombre);

                            $model = new ProductosImagenes();
                            $model->id_producto = $id;
                            $model->imagen = $nombre;
                            $model->fecha_ing = date('Y-m-d H:i:s');
                            $model->id_usuario_ing = \Yii::$app->user->identity->id;
                            $model->principal = 0;
                            $model->save();

                            list($initialPreview, $initialPreviewConfig) = $this->getInitialPreviewAsync($model->id_producto_imagen);

                            if ($isAjax === true) {
                                echo json_encode([
                                    'success' => 'true',
                                    'initialPreview' => $initialPreview,
                                    'initialPreviewConfig' => $initialPreviewConfig,
                                    'append' => true
                                ]);
                            }
                        } else {
                            if ($isAjax === true) {
                                echo json_encode(['success' => 'false', 'error' => $imagen->error]);
                            }
                        }
                    }
                }
            }
        }
    }

    public function crearCarpeta($nombreCarpeta)
    {
        if ($nombreCarpeta != NULL) {
            $basePath = Productos::getRutaProductos();
            if (BaseFileHelper::createDirectory($basePath . $nombreCarpeta, 0777)) {
                BaseFileHelper::createDirectory($basePath . $nombreCarpeta . '/thumbnail', 0777);
            }
        }
    }

    public function CrearThumbnail($nombreCarpeta, $imagen, $width = 250)
    {
        $ruta = Productos::getRutaProductos() . '/' . $nombreCarpeta . '/';
        $file = $ruta . $imagen;

        // Obtener la extensión del archivo de imagen
        $extension = strtolower(pathinfo($file, PATHINFO_EXTENSION));

        // Obtener las dimensiones originales de la imagen
        list($originalWidth, $originalHeight) = getimagesize($file);

        // Calcular la nueva altura proporcionalmente al ancho deseado
        $height = intval($originalHeight * ($width / $originalWidth));

        // Crear una nueva imagen vacía con el tamaño deseado
        $thumbnail = imagecreatetruecolor($width, $height);

        // Cargar la imagen original según su extensión
        if ($extension === 'jpg' || $extension === 'jpeg') {
            $image = imagecreatefromjpeg($file);
        } elseif ($extension === 'png') {
            $image = imagecreatefrompng($file);
        } else {
            // Manejar otros formatos de imagen aquí, si es necesario
            return;
        }

        // Redimensionar la imagen original a la nueva imagen vacía
        imagecopyresampled($thumbnail, $image, 0, 0, 0, 0, $width, $height, $originalWidth, $originalHeight);

        // Guardar la imagen redimensionada en la carpeta de miniaturas
        $thumbnailPath = $ruta . '/thumbnail/' . $imagen;

        if ($extension === 'jpg' || $extension === 'jpeg') {
            // Guardar la imagen redimensionada en formato JPEG
            imagejpeg($thumbnail, $thumbnailPath, 80); // El tercer parámetro es la calidad de compresión (0-100)
        } elseif ($extension === 'png') {
            // Guardar la imagen redimensionada en formato PNG
            imagepng($thumbnail, $thumbnailPath);
        } else {
            // Manejar otros formatos de imagen aquí, si es necesario
        }

        // Liberar memoria
        imagedestroy($image);
        imagedestroy($thumbnail);

        return;
    }


    private function getInitialPreviewAsync($id)
    {
        $datas = ProductosImagenes::find()->where(['id_producto_imagen' => $id])->all();
        $initialPreview = [];
        $initialPreviewConfig = [];
        foreach ($datas as $key => $value) {
            array_push($initialPreview, $this->getTemplatePreview($value));
            array_push($initialPreviewConfig, [
                'caption' => $value->imagen,
                'width' => '120px',
                'url' => Url::to(['/productos/productos/borrarimagen-ajax']),
                'key' => $value->id_producto_imagen
            ]);
        }
        return [$initialPreview, $initialPreviewConfig];
    }

    private function getInitialPreviewPrincipal($id_producto)
    {
        $data = ProductosImagenes::find()->where(['id_producto' => $id_producto, 'principal' => 1])->one();
        $initialPreview = [];
        $initialPreviewConfig = [];
        if ($data) {
            array_push($initialPreview, $this->getTemplatePreview($data));
            array_push($initialPreviewConfig, [
                'caption' => $data->imagen,
                'width' => '120px',
                'url' => Url::to(['/productos/productos/borrarimagen-ajax']),
                'key' => $data->id_producto_imagen
            ]);
        }
        return [$initialPreview, $initialPreviewConfig];
    }

    private function getInitialPreviewExtras($id_producto)
    {
        $datas = ProductosImagenes::find()->where(['id_producto' => $id_producto, 'principal' => 0])->all();
        $initialPreview = [];
        $initialPreviewConfig = [];
        foreach ($datas as $key => $value) {
            array_push($initialPreview, $this->getTemplatePreview($value));
            array_push($initialPreviewConfig, [
                'caption' => $value->imagen,
                'width' => '120px',
                'url' => Url::to(['/productos/productos/borrarimagen-ajax']),
                'key' => $value->id_producto_imagen
            ]);
        }
        return [$initialPreview, $initialPreviewConfig];
    }

    private function getTemplatePreview(ProductosImagenes $model)
    {
        $ruta = Productos::getRutaUrl() . $model->id_producto . '/thumbnail/' . $model->imagen;
        $file = Html::img($ruta, ['class' => 'file-preview-image', 'alt' => $model->imagen, 'title' => $model->imagen]);
        return $file;
    }

    public function actionBorrarimagenAjax()
    {
        $model = ProductosImagenes::findOne(Yii::$app->request->post('key'));
        if ($model !== NULL) {
            $nombre = Productos::getRutaProductos() . $model->id_producto . '/' . $model->imagen;
            $thumbnail = Productos::getRutaProductos() . $model->id_producto . '/thumbnail/' . $model->imagen;
            if ($model->delete()) {
                @unlink($nombre);
                @unlink($thumbnail);
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false]);
            }
        } else {
            echo json_encode(['success' => false]);
        }
    }

    /**
     * Finds the Productos model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_producto Id Producto
     * @return Productos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_producto)
    {
        if (($model = Productos::findOne(['id_producto' => $id_producto])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
