<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\Compras $model */

$this->title = $model->id_compra;
$this->params['breadcrumbs'][] = ['label' => 'Compras', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="compras-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id_compra' => $model->id_compra], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id_compra' => $model->id_compra], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_compra',
            'codigo',
            'num_factura',
            'id_proveedor',
            'tipo_compra',
            'fecha',
            'anulado',
            'comentarios:ntext',
            'fecha_ing',
            'id_usuario_ing',
            'fecha_mod',
            'id_usuario_mod',
            'estado',
        ],
    ]) ?>

</div>
