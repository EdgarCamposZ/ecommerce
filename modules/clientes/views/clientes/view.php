<?php

use app\modules\clientes\models\Direcciones;
use app\modules\clientes\models\DireccionesSearch;
use kartik\editable\Editable;
use kartik\grid\ActionColumn;
use kartik\grid\GridView;
use yii\data\ActiveDataProvider;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\modules\clientes\models\Clientes $model */
/** @var DireccionesSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = $model->id_cliente;
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);

                // Contar las direcciones del cliente
                $direccionesCount = Direcciones::find()->where(['id_cliente' => $model->id_cliente])->count();

                // Verificar si el cliente tiene menos de 6 direcciones
                $permitirCrearDireccion = ($direccionesCount < 6);

?>

<div class="row">
    <div class="col-lg-12">
        <div class="card card-dark">
            <div class="card-header">
                <h3 class="card-title">
                    <?= $model->nombre ?>
                </h3>
            </div>
            <div class="card-body">
                <table class="table table-sm table-striped table-hover table-bordered">
                    <tr>
                        <td width="15%"><b>Id: </b></td>
                        <td width="85%"><span class="badge bg-purple"><?= $model->id_cliente ?></span></td>
                    </tr>
                    <tr>
                        <td><b>Nombre: </b></td>
                        <td>
                            <?= $model->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Apellido: </b></td>
                        <td>
                            <?= $model->apellido ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Telefono: </b></td>
                        <td>
                            <?= $model->telefono ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Email: </b></td>
                        <td>
                            <?= Html::mailto($model->email) ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Fecha creacion: </b></td>
                        <td>
                            <?= date('d-m-Y H:m:i', strtotime($model->fecha_ing)) ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Creado por: </b></td>
                        <td>
                            <?= $model->usuarioIng->nombreCompleto ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Fecha modificacion: </b></td>
                        <td>
                            <?= date('d-m-Y H:m:i', strtotime($model->fecha_mod)) ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Modificado por: </b></td>
                        <td>
                            <?= $model->usuarioMod->nombreCompleto ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Visible: </b></td>
                        <td>
                            <span class="badge bg-<?= $model->estado == 1 ? "green" : "red"; ?>"><?= $model->estado == 1 ? "Activo" : "Inactivo"; ?> </span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="card-footer">
                <?php echo Html::a(
                    '<i class="fa fa-edit"></i> Editar',
                    ['update', 'id_cliente' => $model->id_cliente],
                    ['class' => 'btn btn-primary', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                ) ?>
                <?php echo Html::a(
                    '<i class="fa fa-undo"></i> Regresar',
                    ['index'],
                    ['class' => 'btn btn-warning', 'data-toggle' => 'tooltip', 'title' => 'Regresar']
                ) ?>
                <?= Html::a('<i class="fa fa-trash"></i> Eliminar', ['delete', 'id_cliente' => $model->id_cliente], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Esta seguro de querer eliminar este registro',
                        'method' => 'post',
                    ],
                ]) ?>
                <?php if ($permitirCrearDireccion) {
                    echo Html::a('Crear dirección', ['direcciones/create', 'id_cliente' => $model->id_cliente], ['class' => 'btn btn-success']);
                } else {
                    echo Html::button('Crear dirección', ['class' => 'btn btn-success', 'disabled' => 'disabled']);
                } ?>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="card card-dark">
            <div class="card-header">
                <h3 class="card-title">
                    Direcciones del Cliente
                </h3>
            </div>
            <div class="card-body">
                <?php
                $searchModel = new DireccionesSearch();
                $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $id_cliente);
                ?>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'columns' => [
                        ['class' => 'kartik\grid\SerialColumn'],
                        'contacto',
                        'telefono',
                        'direccion:ntext',
                        [
                            'class' => 'kartik\grid\ActionColumn',
                            'template' => '{view} {update} {delete}',
                            'urlCreator' => function ($action, $model, $key, $index) {
                                return Yii::$app->urlManager->createUrl(['clientes/direcciones/' . $action, 'id' => $model->id_direccion]);
                            },
                            'buttons' => [
                                'view' => function ($url, $model, $key) {
                                    return Html::a('<span class="fas fa-eye"></span>', $url, [
                                        'title' => Yii::t('yii', 'View'),
                                        'data-pjax' => '0',
                                        'class' => 'btn btn-primary btn-xs',
                                    ]);
                                },
                                'update' => function ($url, $model, $key) {
                                    return Html::a('<span class="fas fa-pencil-alt"></span>', $url, [
                                        'title' => Yii::t('yii', 'Update'),
                                        'data-pjax' => '0',
                                        'class' => 'btn btn-info btn-xs',
                                    ]);
                                },
                                'delete' => function ($url, $model, $key) {
                                    return Html::a('<span class="fas fa-trash"></span>', $url, [
                                        'title' => Yii::t('yii', 'Delete'),
                                        'data-confirm' => Yii::t('yii', 'Estas seguro de eliminar este registro?'),
                                        'data-method' => 'post',
                                        'data-pjax' => '0',
                                        'class' => 'btn btn-danger btn-xs',
                                    ]);
                                },
                            ],
                        ],
                    ],
                    'options' => ['class' => 'grid-view'],
                    'tableOptions' => ['class' => 'table table-striped table-bordered'],
                    'pager' => ['class' => 'yii\bootstrap4\LinkPager'],
                    'summaryOptions' => ['class' => 'summary'],
                    'layout' => '{items}{summary}{pager}',
                    'showHeader' => true,
                    'showFooter' => false,
                    'showOnEmpty' => true,
                ]); ?>
            </div>
        </div>
    </div>
</div>