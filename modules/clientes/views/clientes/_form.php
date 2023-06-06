<?php

use kartik\widgets\ActiveForm;
use kartik\widgets\SwitchInput;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\clientes\models\Clientes $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="row">
    <div class="col-md-12">
        <div class="card card-dark">
            <div class="card-header">
                <h3 class="card-title">Crear / Editar registro</h3>
            </div>
            <?php $form = ActiveForm::begin(['id' => 'crear-form'], ['options' => ['enctype' => 'multipart/form-data']]); ?>
            <div class="card-body">
                <form role="form">
                    <div class="row">
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'nombre', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'nombre', ['showLabels' => false])->textInput(['autofocus' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'apellido', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'apellido', ['showLabels' => false])->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'telefono', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'telefono', ['showLabels' => false])->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'email', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'email', ['showLabels' => false])->textInput() ?>
                        </div>
                        <div class="col-md-12">
                            <?= Html::activeLabel($model, 'estado', ['class' => 'control-label']) ?>
                            <?php
                            echo $form->field($model, 'estado', ['showLabels' => false])->widget(SwitchInput::class, [
                                'pluginOptions' => [
                                    'handleWitdth' => 80,
                                    'onColor' => 'success',
                                    'offColor' => 'danger',
                                    'onText' => '<i class="fa fa-check"></i> Activo',
                                    'offText' => '<i class="fa fa-ban"></i> Inactivo'
                                ]
                            ]);
                            ?>
                        </div>
                    </div>
                    <div class="card-footer">
                        <?= Html::submitButton(
                            $model->isNewRecord ? '<i class="fa fa-save"></i> Guardar' : '<i class="fa fa-save"></i> Actualizar',
                            ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'name' => 'submit-button']
                        ) ?>
                        <?= Html::a('<i class="fa fa-ban"></i> Cancelar', ['index'], ['class' => 'btn btn-danger']) ?>
                    </div>
                </form>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
</div>