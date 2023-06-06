<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\productos\models\SubCategorias $model */

$this->title = 'Editar registro';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => 'Detalle', 'url' => ['view', 'id_sub_categoria' => $model->id_sub_categoria]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="sub-categorias-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
