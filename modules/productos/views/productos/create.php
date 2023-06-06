<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\productos\models\Productos $model */

$this->title = 'Crear registro';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="productos-create">

    <?= $this->render('_form', [
        'model' => $model
    ]) ?>

</div>
