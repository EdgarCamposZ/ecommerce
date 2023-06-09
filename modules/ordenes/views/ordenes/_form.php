<?php

use app\modules\clientes\models\Clientes;
use app\modules\clientes\models\Direcciones;
use kartik\widgets\ActiveForm;
use kartik\widgets\DepDrop;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\Ordenes $model */
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
                            <?= Html::activeLabel($model, 'id_cliente', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_cliente', ['showLabels' => false])->widget(Select2::class, [
                                'data' => ArrayHelper::map(Clientes::find()->all(), 'id_cliente', 'nombre'),
                                'language' => 'es',
                                'options' => ['placeholder' => '- Seleccionar Cliente -'],
                                'pluginOptions' => ['allowClear' => true],
                            ]); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::hiddenInput('model_id1', $model->isNewRecord ? '' : $model->id_cliente, ['id' => 'model_id1']); ?>
                            <?= Html::activeLabel($model, 'id_direccion', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_direccion', ['showLabels' => false])->widget(DepDrop::class, [
                                'language' => 'es',
                                'type' => DepDrop::TYPE_SELECT2,
                                'pluginOptions' => [
                                    'depends' => ['ordenes-id_cliente'],
                                    'initialize' => $model->isNewRecord ? false : true,
                                    'url' => Url::to(['/ordenes/default/direcciones']),
                                    'placeholder' => '- Seleccionar Direccion -',
                                    'loadingText' => 'Cargando datos...',
                                    'params' => ['model_id1']
                                ]
                            ]); ?>
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