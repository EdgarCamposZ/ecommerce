<?php

use kartik\grid\GridView;
use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\Ordenes $model */

$this->title = $model->id_orden;
$this->params['breadcrumbs'][] = ['label' => 'Ordenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="row">
    <div class="col-md-8">
        <div class="card card-outline card-dark">
            <div class="card-header">
                <h3 class="card-title">Datos de orden</h3>
            </div>
            <div class="card-body">
                <table class="table table-sm table-striped table-hover table-bordered">
                    <tr>
                        <td width="20%"><b>Id</b></td>
                        <td width="30%"><span class="badge bg-purple"><?= $orden->id_orden ?></span></td>
                        <td width="20%"><b>Cliente:</b></td>
                        <td width="30%"><?= $orden->cliente->nombre ?></td>
                    </tr>
                    <tr>
                        <td><b>Direccion:</b></td>
                        <td><?= $orden->direccion->direccion ?></td>
                        <td><b>Estado:</b></td>
                        <td><span class="badge bg-<?= $orden->estado == 0 ? "warning" : "red"; ?>"><?= $orden->estado == 0 ? "En revision" : "Procesada"; ?></span></td>
                    </tr>
                    <tr>
                        <td><b>Fecha:</b></td>
                        <td><?= $orden->fecha_ing ?></td>
                    </tr>
                </table>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-md-6 text-left">
                        <?php if ($model->estado == 0) {
                            echo Html::a(
                                '<i class="fa fa-edit"></i> Editar',
                                ['update', 'id_orden' => $model->id_orden],
                                ['class' => 'btn btn-primary', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                            );
                        } else {
                            echo Html::a(
                                '<i class="fa fa-edit"></i> Editar',
                                ['update', 'id_orden' => $model->id_orden],
                                ['class' => 'btn btn-primary disabled', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                            );
                        } ?>
                        <?php echo Html::a(
                            '<i class="fa fa-undo"></i> Cancelar',
                            ['index'],
                            ['class' => 'btn btn-danger', 'data-toggle' => 'tooltip', 'title' => 'Cancelar']
                        ) ?>
                    </div>
                    <div class="col-md-6 text-right">
                        <?php if ($model->estado == 0) {
                            echo Html::a(
                                '<i class="fa fa-plus"></i> Agregar items',
                                ['/ordenes/det-ordenes/create', 'id_orden' => $model->id_orden],
                                ['class' => 'btn btn-info', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                            );
                        } else {
                            echo Html::a(
                                '<i class="fa fa-plus"></i> Agregar items',
                                ['/ordenes/det-ordenes/create', 'id_orden' => $model->id_orden],
                                ['class' => 'btn btn-info disabled', 'data-toggle' => 'tooltip', 'title' => 'Edit record']
                            );
                        } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body" style="background-color: #ffdf7e;">
                <table class="table table-sm" style="text-align: right;">
                    <tr>
                        <td width="40%">
                            <h4>Sub-Total:</h4>
                        </td>
                        <td width="10%">
                            <h4>$</h4>
                        </td>
                        <td width="10%">
                            <h4><?php echo number_format($sub_total, 2) ?></h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Total:</h4>
                        </td>
                        <td>
                            <h4>$</h4>
                        </td>
                        <td>
                            <h4><b><?php echo number_format($total, 2) ?></b></h4>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="det-ordenes-index">
            <?php
            $gridColums = [
                [
                    'class' => 'kartik\grid\SerialColumn',
                    'contentOptions' => ['class' => 'kartik-sheet-style'],
                    'width' => '36px',
                    'header' => '#',
                    'headerOptions' => ['class' => 'kartik-sheet-style']
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'id_producto',
                    'width' => '25%',
                    'vAlign' => 'middle',
                    'format' => 'html',
                    'value' => function ($model) {
                        return $model->producto->nombre;
                    },
                    'pageSummary' => 'Total',
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'cantidad',
                    'hAlign' => 'right',
                    'vAlign' => 'middle',
                    'width' => '10%',
                    'pageSummary' => false,
                    'filter' => false,
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'precio',
                    'hAlign' => 'right',
                    'vAlign' => 'middle',
                    'width' => '10%',
                    'pageSummary' => false,
                    'filter' => false,
                    'format' => 'currency',
                    'value' => function ($model) {
                        return $model->producto->precio;
                    },
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'descuento',
                    'hAlign' => 'right',
                    'vAlign' => 'middle',
                    'width' => '10%',
                    'pageSummary' => false,
                    'filter' => false,
                ],
                [
                    'class' => 'kartik\grid\FormulaColumn',
                    'header' => 'Total descuento',
                    'vAlign' => 'middle',
                    'value' => function ($model, $key, $index, $widget) {
                        $p = compact('model', 'key', 'index');
                        return ($widget->col(2, $p) * $widget->col(3, $p)) * ($widget->col(4, $p) / 100);
                    },
                    'headerOptions' => ['class' => 'kartik-sheet-style'],
                    'hAlign' => 'right',
                    'width' => '10%',
                    'mergeHeader' => true,
                    'pageSummary' => true,
                    'footer' => true,
                    'format' => 'currency'
                ],
                [
                    'class' => 'kartik\grid\FormulaColumn',
                    'header' => 'Sub-Total',
                    'vAlign' => 'middle',
                    'value' => function ($model, $key, $index, $widget) {
                        $p = compact('model', 'key', 'index');
                        return ($widget->col(2, $p) * $widget->col(3, $p)) - ($widget->col(5, $p));
                    },
                    'headerOptions' => ['class' => 'kartik-sheet-style'],
                    'hAlign' => 'right',
                    'width' => '10%',
                    'mergeHeader' => true,
                    'pageSummary' => true,
                    'footer' => true,
                    'format' => 'currency'
                ],
                [
                    'class' => 'kartik\grid\FormulaColumn',
                    'header' => 'IVA',
                    'vAlign' => 'middle',
                    'value' => function ($model, $key, $index, $widget) {
                        $p = compact('model', 'key', 'index');
                        return ($widget->col(6, $p) * 0.13);
                    },
                    'headerOptions' => ['class' => 'kartik-sheet-style'],
                    'hAlign' => 'right',
                    'width' => '10%',
                    'mergeHeader' => true,
                    'pageSummary' => true,
                    'footer' => true,
                    'format' => 'currency'
                ],
                [
                    'class' => 'kartik\grid\FormulaColumn',
                    'header' => 'Total',
                    'vAlign' => 'middle',
                    'value' => function ($model, $key, $index, $widget) {
                        $p = compact('model', 'key', 'index');
                        return ($widget->col(6, $p) + $widget->col(7, $p));
                    },
                    'headerOptions' => ['class' => 'kartik-sheet-style'],
                    'hAlign' => 'right',
                    'width' => '10%',
                    'mergeHeader' => true,
                    'pageSummary' => true,
                    'footer' => true,
                    'format' => 'currency'
                ],
            ];

            echo GridView::widget([
                'id' => 'kv-det-compras',
                'dataProvider' => $grid,
                'columns' => $gridColums,
                'containerOptions' => ['style' => 'overflow: auto'], //only set when $responsive = false
                'headerRowOptions' => ['class' => 'kartik-sheet-style'],
                'filterRowOptions' => ['class' => 'kartik-sheet-style'],
                'pjax' => true, //pjax is set to always true for this demo
                // set your toolbar
                'toolbar' => [],
                'toggleDataContainer' => ['class' => 'btn-group mr-2'],
                // set export properties
                // parameters from the demo form
                'bordered' => true,
                'striped' => true,
                'condensed' => true,
                'responsive' => true,
                'hover' => true,
                'showPageSummary' => true,
                'panel' => [
                    'type' => 'dark',
                    'heading' => '',
                ],
                'persistResize' => false,
            ]);
            ?>
        </div>
    </div>
</div>