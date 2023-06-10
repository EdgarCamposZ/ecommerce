<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\DetOrdenes $model */

$this->title = 'Crear registro';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="det-ordenes-create">

    <?= $this->render('_form', [
        'model' => $model,
        'orden' => $orden,
        'grid' => $grid,
        'sub_total' => $sub_total,
        'total' => $total,
    ]) ?>

</div>
