<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\productos\models\Productos $model */

$this->title = 'Editar registro';
$this->params['breadcrumbs'][] = ['label' => 'Listado de productos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => 'Detalle', 'url' => ['view', 'id_producto' => $model->id_producto]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="productos-update">

    <?= $this->render('_form_update', [
        'model' => $model,
        'initialPreviewExtras' => $initialPreviewExtras,
        'initialPreviewPrincipal' => $initialPreviewPrincipal,
        'initialPreviewConfigExtras' => $initialPreviewConfigExtras,
        'initialPreviewConfigPrincipal' => $initialPreviewConfigPrincipal
    ]) ?>

</div>
