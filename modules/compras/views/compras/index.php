<?php

use app\modules\compras\models\Compras;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\ComprasSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Compras';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="compras-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Compras', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_compra',
            'codigo',
            'num_factura',
            'id_proveedor',
            'tipo_compra',
            //'fecha',
            //'anulado',
            //'comentarios:ntext',
            //'fecha_ing',
            //'id_usuario_ing',
            //'fecha_mod',
            //'id_usuario_mod',
            //'estado',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Compras $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_compra' => $model->id_compra]);
                 }
            ],
        ],
    ]); ?>


</div>
