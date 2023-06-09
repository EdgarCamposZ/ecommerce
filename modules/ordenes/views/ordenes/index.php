<?php

use app\modules\ordenes\models\Ordenes;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\OrdenesSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Ordenes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ordenes-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Ordenes', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_orden',
            'id_cliente',
            'id_direccion',
            'fecha_ing',
            'id_usuario_ing',
            //'fecha_mod',
            //'id_usuario_mod',
            //'estado',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Ordenes $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_orden' => $model->id_orden]);
                 }
            ],
        ],
    ]); ?>


</div>
