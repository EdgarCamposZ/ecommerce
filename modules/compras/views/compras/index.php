<?php

use app\modules\compras\models\Compras;
use app\modules\compras\models\Proveedores;
use yii\helpers\Html;
use yii\helpers\Url;
use kartik\export\ExportMenu;
use kartik\grid\GridView;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\ComprasSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Listado de Compras';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
    <div class="col-md-12">
        <div class="compras-index">
            <h1><?php //= Html::encode($this->title) 
                ?></h1>
            <?php //echo $this->render('_search', ['model' => $searchModel]); 
            ?>

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
                    'width' => '80px',
                    'format' => 'raw',
                    'vAlign' => 'middle',
                    'hAlign' => 'center',
                    'attribute' => 'id_compra',
                    'value' => function ($model, $key, $index, $widget) {
                        return Html::tag('span', $model->id_compra, ['class' => 'badge bg-purple']);
                    },
                    'filter' => false,
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'codigo',
                    'width' => '250px',
                    'vAlign' => 'middle',
                    'format' => 'html',
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'num_factura',
                    'width' => '250px',
                    'vAlign' => 'middle',
                    'format' => 'html',
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'id_proveedor',
                    'width' => '250px',
                    'vAlign' => 'middle',
                    'format' => 'html',
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'tipo_compra',
                    'width' => '250px',
                    'vAlign' => 'middle',
                    'format' => 'html',
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'fecha',
                    'width' => '250px',
                    'vAlign' => 'middle',
                    'format' => 'html',
                ],
                [
                    'attribute' => 'fecha_ing',
                    'vAlign' => 'middle',
                    'width' => '250px',
                    'value' => function ($model) {
                        return date("d-m-Y", strtotime($model->fecha_ing));
                    },
                    'filterType' => GridView::FILTER_DATE_RANGE,
                    'filterWidgetOptions' => ([
                        'model' => $searchModel,
                        'attribute' => 'fecha_ing',
                        'presetDropdown' => true,
                        'hideInput' => true,
                        'defaultPresetValueOptions' => ['style' => 'display:none'],
                        'convertFormat' => true,
                        'readonly' => true,
                        'options' => [
                            'placeholder' => 'Seleccionar rango...'
                        ],
                        'pluginOptions' => [
                            'locale' => ['format' => 'Y-m-d'],
                            'opens' => 'left'
                        ],
                    ]),
                ],
                [
                    'class' => 'kartik\grid\BooleanColumn',
                    'attribute' => 'estado',
                    'vAlign' => 'middle',
                    'width' => '120px',
                    'filterType' => GridView::FILTER_SELECT2,
                    'filterWidgetOptions' => [
                        'options' => ['placeholder' => 'Todos...'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ],
                ],
                [
                    'class' => 'kartik\grid\ActionColumn',
                    'header' => 'Acciones',
                    'urlCreator' => function ($action, Compras $model, $key, $index, $column) {
                        return Url::toRoute([$action, 'id_compra' => $model->id_compra]);
                    }
                ],
            ];

            $exportmenu = ExportMenu::widget([
                'dataProvider' => $dataProvider,
                'columns' => $gridColums,
                'exportConfig' => [
                    ExportMenu::FORMAT_TEXT => false,
                    ExportMenu::FORMAT_HTML => false,
                    ExportMenu::FORMAT_CSV => false,
                ],
            ]);

            echo GridView::widget([
                'id' => 'kv-proveedores',
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => $gridColums,
                'containerOptions' => ['style' => 'overflow: auto'], //only set when $responsive = false
                'headerRowOptions' => ['class' => 'kartik-sheet-style'],
                'filterRowOptions' => ['class' => 'kartik-sheet-style'],
                'pjax' => true, //pjax is set to always true for this demo
                // set your toolbar
                'toolbar' => [
                    [
                        'content' =>
                        Html::a('<i class="fas fa-plus"></i> Agregar', ['create'], [
                            'class' => 'btn btn-success',
                            'data-pjax' => 0,
                        ]) . ' ' .
                            Html::a('<i class="fas fa-redo"></i>', ['index'], [
                                'class' => 'btn btn-outline-success',
                                'data-pjax' => 0,
                            ]),
                        'options' => ['class' => 'btn-group mr-2']
                    ],
                    $exportmenu,
                    '{toggleData}',
                ],
                'toggleDataContainer' => ['class' => 'btn-group mr-2'],
                // set export properties
                // parameters from the demo form
                'bordered' => true,
                'striped' => true,
                'condensed' => true,
                'responsive' => true,
                'hover' => true,
                // 'showPageSummary' => $pageSummary,
                'panel' => [
                    'type' => 'dark',
                    'heading' => 'Listado de Compras',
                ],
                'persistResize' => false,
            ]);
            ?>
        </div>
    </div>
</div>