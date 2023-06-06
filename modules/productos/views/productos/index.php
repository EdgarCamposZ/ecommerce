<?php

use app\modules\productos\models\Categorias;
use app\modules\productos\models\Productos;
use app\modules\productos\models\SubCategorias;
use kartik\export\ExportMenu;
use kartik\grid\GridView;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat\Wizard\Currency;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var app\modules\productos\models\ProductosSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Listado de Productos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
    <div class="col-md-12">
        <div class="categorias-index">
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
                    'width' => '40px',
                    'format' => 'raw',
                    'vAlign' => 'middle',
                    'hAlign' => 'center',
                    'attribute' => 'id_producto',
                    'value' => function ($model, $key, $index, $widget) {
                        return Html::tag('span', $model->id_producto, ['class' => 'badge bg-purple']);
                    },
                    'filter' => false,
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'label' => 'Imagen',
                    'vAlign' => 'middle',
                    'hAlign' => 'center',
                    'content' => function ($model) {
                        return Html::img($model->getImagenPrincipal($model->id_producto, 1), ['style' => 'width: 100px']);
                    },
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'nombre',
                    'vAlign' => 'middle',
                    'format' => 'html',
                    'value' => function ($model, $key, $index, $widget) {
                        return Html::a($model->nombre, ['view', 'id_producto' => $model->id_producto]);
                    },
                    'filterType' => GridView::FILTER_SELECT2,
                    'filter' => ArrayHelper::map(Productos::find()->orderBy('nombre')->all(), 'nombre', 'nombre'),
                    'filterWidgetOptions' => [
                        'options' => ['placeholder' => 'Todos...'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ],
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'sku',
                    'vAlign' => 'middle',
                    'format' => 'html',
                    'value' => 'sku',
                    'filterType' => GridView::FILTER_SELECT2,
                    'filter' => ArrayHelper::map(Productos::find()->orderBy('sku')->all(), 'sku', 'sku'),
                    'filterWidgetOptions' => [
                        'options' => ['placeholder' => 'Todos...'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ],
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'precio',
                    'vAlign' => 'middle',
                    'format' => 'html',
                    'value' => function ($model, $key, $index, $widget) {
                        return Yii::$app->formatter->asCurrency($model->precio);
                    },
                    'filter' => false,
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'id_categoria',
                    'vAlign' => 'middle',
                    'format' => 'html',
                    'value' => 'categoria.nombre',
                    'width' => '250px',
                    'filterType' => GridView::FILTER_SELECT2,
                    'filter' => ArrayHelper::map(Categorias::find()->orderBy('nombre')->all(), 'id_categoria', 'nombre'),
                    'filterWidgetOptions' => [
                        'options' => ['placeholder' => 'Todos...'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ],
                ],
                [
                    'class' => 'kartik\grid\DataColumn',
                    'attribute' => 'id_sub_categoria',
                    'vAlign' => 'middle',
                    'format' => 'html',
                    'value' => 'subCategoria.nombre',
                    'width' => '250px',
                    'filterType' => GridView::FILTER_SELECT2,
                    'filter' => ArrayHelper::map(SubCategorias::find()->orderBy('nombre')->all(), 'id_categoria', 'nombre'),
                    'filterWidgetOptions' => [
                        'options' => ['placeholder' => 'Todos...'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ],
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
                    'urlCreator' => function ($action, Productos $model, $key, $index, $column) {
                        return Url::toRoute([$action, 'id_producto' => $model->id_producto]);
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
                'id' => 'kv-sub-categorias',
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
                    'heading' => 'Listado de subcategorias',
                ],
                'persistResize' => false,
            ]);
            ?>
        </div>
    </div>
</div>