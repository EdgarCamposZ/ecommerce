<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\Ordenes $model */

$this->title = 'Editar registro';
$this->params['breadcrumbs'][] = ['label' => 'Listado de ordenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_orden, 'url' => ['view', 'id_orden' => $model->id_orden]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ordenes-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>