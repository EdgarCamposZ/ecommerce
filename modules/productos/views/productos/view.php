<?php
Yii::$app->language = 'es_ES';

use yii\helpers\Html;
use yii\widgets\DetailView;
use dosamigos\gallery\Gallery;

Yii::$app->formatter->locale = 'en-US';

/** @var yii\web\View $this */
/** @var app\modules\productos\models\Productos $model */

$this->title = 'Detalle';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
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
                        <td width="85%"><span class="badge bg-purple"><?= $model->id_producto ?></span></td>
                    </tr>
                    <tr>
                        <td><b>Nombre: </b></td>
                        <td>
                            <?= $model->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>SKU: </b></td>
                        <td>
                            <?= $model->sku ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Precio: </b></td>
                        <td>
                            <?= $model->precio ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Marca: </b></td>
                        <td>
                            <?= $model->marca->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Categoria: </b></td>
                        <td>
                            <?= $model->categoria->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>SubCategoria: </b></td>
                        <td>
                            <?= $model->subCategoria->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Descripcion: </b></td>
                        <td>
                            <?= $model->descripcion ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Imagen Principal: </b></td>
                        <td>
                            <?php if ($imagenPrincipal == NULL) { ?>
                                <img src="<?= Yii::$app->request->hostInfo ?>/productos/no_disponible.png" width="150" />
                            <?php } else {
                                echo Gallery::widget(['items' => $model->getThumbnails($model->id_producto, 1)]); ?>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Otras Imagenes: </b></td>
                        <td>
                            <?= Gallery::widget(['items' => $model->getThumbnails($model->id_producto, 0)]); ?>
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
                    ['update', 'id_producto' => $model->id_producto],
                    ['class' => 'btn btn-primary', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                ) ?>
                <?php echo Html::a(
                    '<i class="fa fa-undo"></i> Regresar',
                    ['index'],
                    ['class' => 'btn btn-warning', 'data-toggle' => 'tooltip', 'title' => 'Regresar']
                ) ?>
                <?= Html::a('<i class="fa fa-trash"></i> Eliminar', ['delete', 'id_producto' => $model->id_producto], [
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