<?php

namespace app\modules\ordenes\controllers;

use app\controllers\CoreController;
use app\models\Bitacora;
use app\modules\ordenes\models\DetOrdenes;
use app\modules\ordenes\models\DetOrdenesSearch;
use app\modules\ordenes\models\Ordenes;
use app\modules\productos\models\Productos;
use Exception;
use kartik\grid\EditableColumnAction;
use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;

/**
 * DetOrdenesController implements the CRUD actions for DetOrdenes model.
 */
class DetOrdenesController extends Controller
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
     * Lists all DetOrdenes models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new DetOrdenesSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DetOrdenes model.
     * @param int $id_det_orden Id Det Orden
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_det_orden)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_det_orden),
        ]);
    }

    /**
     * Creates a new DetOrdenes model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate($id_orden)
    {
        $model = new DetOrdenes();
        $orden = Ordenes::find()->where(['id_orden' => $id_orden])->one();
        $grid = new ActiveDataProvider(['query' => DetOrdenes::find()->where(['id_orden' => $id_orden])]);

        $sub_total = 0;
        $total = 0;

        $detOrdenes = DetOrdenes::find()->where(['id_orden' => $id_orden])->all();

        foreach ($detOrdenes as $detOrden) {
           $sub_total += ($detOrden->producto->precio * $detOrden->cantidad) - ($detOrden->producto->precio * $detOrden->cantidad) * ($detOrden->descuento / 100);
           $total += (($detOrden->producto->precio * $detOrden->cantidad) - ($detOrden->producto->precio * $detOrden->cantidad) * ($detOrden->descuento / 100)) * (1.13);
        }

        if ($model->load($this->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $duplicado = DetOrdenes::find()->where(['id_orden' => $id_orden, 'id_producto' => $model->id_producto])->one();

                if ($duplicado) {
                    Yii::$app->session->setFlash('warning', "El producto ya existe en la orden");
                    return $this->redirect(['create', 'id_orden' => $id_orden]);
                }

                $model->id_orden = $id_orden;

                if (!$model->save()) {
                    throw new Exception(implode("<br />", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0, false)));
                }

                $data_original = Json::encode($model->getAttributes(), JSON_PRETTY_PRINT);

                $bitacora = new Bitacora();
                $bitacora->id_registro = $model->id_det_orden;
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
            return $this->redirect(['create', 'id_orden' => $id_orden]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'orden' => $orden,
                'grid' => $grid,
                'sub_total' => $sub_total,
                'total' => $total,
            ]);
        } 
    } // http://ecommerce.test/index.php?r=ordenes%2Fdet-ordenes%2Fcreate&id_orden=1

    /**
     * Updates an existing DetOrdenes model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_det_orden Id Det Orden
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_det_orden)
    {
        $model = $this->findModel($id_det_orden);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_det_orden' => $model->id_det_orden]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    public function actions()
    {
        return ArrayHelper::merge(parent::actions(), [
            'editarcantidad' => [
                'class' => EditableColumnAction::class,
                'modelClass' => DetOrdenes::class,
            ],
            'editardescuento' => [
                'class' => EditableColumnAction::class,
                'modelClass' => DetOrdenes::class,
            ],
        ]);
    }

    /**
     * Deletes an existing DetOrdenes model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_det_orden Id Det Orden
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_det_orden, $id_orden)
    {
        $this->findModel($id_det_orden)->delete();
        Yii::$app->session->setFlash('danger', "Registro eliminado exitosamente.");
        return $this->redirect(['create', 'id_orden' => $id_orden]);
    }

    /**
     * Finds the DetOrdenes model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_det_orden Id Det Orden
     * @return DetOrdenes the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_det_orden)
    {
        if (($model = DetOrdenes::findOne(['id_det_orden' => $id_det_orden])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
