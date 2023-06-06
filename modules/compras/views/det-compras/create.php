<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\DetCompras $model */

$this->title = 'Agregar detalle de compra';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="det-compras-create">

    <?= $this->render('_form', [
        'model' => $model,
        'compra' => $compra,
        'grid' => $grid,
        'sub_total' => $sub_total,
        'iva' => $iva,
        'retencion' => $retencion,
        'total' => $total,
    ]) ?>

</div>