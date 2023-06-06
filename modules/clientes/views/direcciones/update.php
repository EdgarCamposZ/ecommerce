<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\clientes\models\Direcciones $model */

$this->title = 'Update Direcciones: ' . $model->id_direccion;
$this->params['breadcrumbs'][] = ['label' => 'Direcciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_direccion, 'url' => ['view', 'id_direccion' => $model->id_direccion]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="direcciones-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
