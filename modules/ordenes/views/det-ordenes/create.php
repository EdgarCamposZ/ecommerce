<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\DetOrdenes $model */

$this->title = 'Create Det Ordenes';
$this->params['breadcrumbs'][] = ['label' => 'Det Ordenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="det-ordenes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'orden' => $orden,
        'grid' => $grid,
        'sub_total' => $sub_total,
        'iva' => $iva,
        'retencion' => $retencion,
        'total' => $total,
    ]) ?>

</div>
