<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\productos\models\Categorias $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="categorias-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'fecha_ing')->textInput() ?>

    <?= $form->field($model, 'id_usuario_ing')->textInput() ?>

    <?= $form->field($model, 'fecha_mod')->textInput() ?>

    <?= $form->field($model, 'id_usuario_mod')->textInput() ?>

    <?= $form->field($model, 'estado')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
