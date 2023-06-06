<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\modules\clientes\models\Direcciones $model */

$this->title = $model->id_direccion;
$this->params['breadcrumbs'][] = ['label' => 'Direcciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="row">
    <div class="col-lg-12">
        <div class="card card-dark">
            <div class="card-header">
            </div>
            <div class="card-body">
                <table class="table table-sm table-striped table-hover table-bordered">
                    <tr>
                        <td width="15%"><b>Cliente: </b></td>
                        <td width="85%"><?= $model->cliente->nombre, ' ', $model->cliente->apellido ?></td>
                    </tr>
                    <tr>
                        <td><b>Contacto: </b></td>
                        <td>
                            <?= $model->contacto ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Telefono: </b></td>
                        <td>
                            <?= $model->telefono ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Direccion: </b></td>
                        <td>
                            <?= $model->direccion ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Departamento: </b></td>
                        <td>
                            <?= $model->departamento->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Municipio: </b></td>
                        <td>
                            <?= $model->municipio->nombre ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Principal: </b></td>
                        <td>
                            <span class="badge bg-<?= $model->principal == 1 ? "green" : "red"; ?>"><?= $model->principal == 1 ? "Principal" : "Otra"; ?> </span>
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
                    ['update', 'id_direccion' => $model->id_direccion],
                    ['class' => 'btn btn-primary', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                ) ?>
                <?php echo Html::a(
                    '<i class="fa fa-undo"></i> Regresar',
                    ['clientes/view', 'id_cliente' => $model->id_cliente],
                    ['class' => 'btn btn-warning', 'data-toggle' => 'tooltip', 'title' => 'Regresar']
                ) ?>
                <?= Html::a('<i class="fa fa-trash"></i> Eliminar', ['delete', 'id_direccion' => $model->id_direccion], [
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