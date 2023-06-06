<?php

namespace app\modules\compras\controllers;

use app\controllers\CoreController;
use app\models\Bitacora;
use app\modules\compras\models\Compras;
use app\modules\compras\models\ComprasSearch;
use Exception;
use yii\helpers\Json;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Json as HelpersJson;

/**
 * ComprasController implements the CRUD actions for Compras model.
 */
class ComprasController extends Controller
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
     * Lists all Compras models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ComprasSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Compras model.
     * @param int $id_compra Id Compra
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_compra)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_compra),
        ]);
    }

    /**
     * Creates a new Compras model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Compras();

        if ($model->load($this->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model->codigo = $this->CreateCodigo();
                $model->anulado = 0;
                $model->estado = 0;

                if (!$model->save()) {
                    throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0, false)));
                }

                $data_original = Json::encode($model->getAttributes(), JSON_PRETTY_PRINT);

                $bitacora = new Bitacora();
                $bitacora->id_registro = $model->id_compra;
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
            return $this->redirect(['det-compras/create', 'id_compra' => $model->id_compra]);
        } else {
            return $this->render('create', ['model' => $model,]);
        }
    }
    
    //** Crear codigo para compra */
    function CreateCodigo()
    {
        $compra = Compras::find()->orderBy(['id_compra' => SORT_DESC])->one();
        if (empty($compra->codigo)) $codigo = 0;
        else $codigo = $compra->codigo;

        $int = intval(preg_replace('/[^0-9]+/', '', $codigo), 10);
        $id = $int + 1;

        $numero = $id;
        $tmp = "";
        if ($id < 10) {
            $tmp .= '0000';
            $tmp .= $id;
        } elseif ($id >= 10 && $id < 100) {
            $tmp .= "000";
            $tmp .= $id;
        } elseif ($id >= 100 && $id < 1000) {
            $tmp .= "00";
            $tmp .= $id;
        } elseif ($id >= 1000 && $id < 10000) {
            $tmp .= "0";
            $tmp .= $id;
        } 
        else {
            $tmp .= $id;
        }
        $result = str_replace($id, $tmp, $numero);
        return "CMPR-" . $result;
    }

    /**
     * Updates an existing Compras model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_compra Id Compra
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_compra)
    {
        $model = $this->findModel($id_compra);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_compra' => $model->id_compra]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Compras model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_compra Id Compra
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_compra)
    {
        $this->findModel($id_compra)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Compras model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_compra Id Compra
     * @return Compras the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_compra)
    {
        if (($model = Compras::findOne(['id_compra' => $id_compra])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
