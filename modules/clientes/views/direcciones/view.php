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
<div class="direcciones-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id_direccion' => $model->id_direccion], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id_direccion' => $model->id_direccion], [
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
            'id_direccion',
            'id_cliente',
            'contacto',
            'telefono',
            'direccion:ntext',
            'id_departamento',
            'id_municipio',
            'principal',
            'fecha_ing',
            'id_usuario_ing',
            'fecha_mod',
            'id_usuario_mod',
            'estado',
        ],
    ]) ?>

</div>
