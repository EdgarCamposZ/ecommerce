<?php

use PhpOffice\PhpSpreadsheet\Chart\Title;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\Compras $model */

$this->title = 'Editar registro' . $model->id_compra;
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => 'Detalle', 'url' => ['view', 'id_compra' => $model->id_compra]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="compras-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
