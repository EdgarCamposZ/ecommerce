<?php
Yii::$app->language = 'es_ES';

use yii\helpers\Html;
use coderius\lightbox2\Lightbox2;

Yii::$app->formatter->locale = 'en-US';

/** @var yii\web\View $this */
/** @var app\modules\productos\models\Categorias $model */

$this->title = 'Detalle';
$this->params['breadcrumbs'][] = ['label' => 'Listado de categorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
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
                        <td width="85%"><span class="badge bg-purple"><?= $model->id_categoria ?></span></td>
                    </tr>
                    <tr>
                        <td><b>Nombre: </b></td>
                        <td>
                            <?= $model->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Descripcion: </b></td>
                        <td>
                            <?= $model->descripcion ?>
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
                    ['update', 'id_categoria' => $model->id_categoria],
                    ['class' => 'btn btn-primary', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                ) ?>
                <?php echo Html::a(
                    '<i class="fa fa-undo"></i> Regresar',
                    ['index'],
                    ['class' => 'btn btn-warning', 'data-toggle' => 'tooltip', 'title' => 'Regresar']
                ) ?>
                <?= Html::a('<i class="fa fa-trash"></i> Eliminar', ['delete', 'id_categoria' => $model->id_categoria], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Esta seguro de querer eliminar este registro',
                        'method' => 'post',
                    ],
                ]) ?>
            </div>
        </div>
    </div>
</div>

<?= $this->render('_gridSubCategorias', [
    'model' => $model,
    'searchModel' => $searchModel,
    'dataProvider' => $dataProvider,
]) ?>