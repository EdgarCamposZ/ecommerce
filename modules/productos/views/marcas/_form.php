<?php
Yii::$app->language = 'es_ES';

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\editors\Summernote;
use kartik\widgets\FileInput;
use kartik\widgets\SwitchInput;


/** @var yii\web\View $this */
/** @var app\modules\productos\models\Marcas $model */
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
                        <div class="col-md-12">
                            <?= Html::activeLabel($model, 'nombre', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'nombre', ['showLabels' => false])->textInput(['autofocus' => true]) ?>
                        </div>
                        <div class="col-md-12">
                            <?= Html::activeLabel($model, 'descripcion', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'descripcion', ['showLabels' => false])->widget(Summernote::class, ['useKrajeePresets' => false, 
                                'container' => [
                                    'class' => 'kv-editor-container',
                                ],
                                'pluginOptions' => [
                                    'height' => 200,
                                    'dialogsFade' => true,
                                    'toolbar' => [
                                        ['style1', ['style']],
                                        ['style2', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript']],
                                        ['font', ['fontname', 'fontsize', 'color', 'clear']],
                                        ['para', ['ul', 'ol', 'paragraph', 'height']],
                                        ['insert', ['link', 'table', 'hr']],
                                    ],
                                    'fontSizes' => ['8', '9', '10', '11', '12', '13', '14', '16', '18', '20', '24', '36', '48'],
                                    'placeholder' => 'Escribir descripcion de la marca...',
                                ]
                            ]); ?>
                        </div>
                        <div class="col-md-12">
                            <?= $form->field($model, 'imagenDb', ['showLabels' => false])->hiddenInput(['value' => $model->imagen]) ?>
                        </div>
                        <?php 
                            if ($model->imagen) {
                                $preview = '<img src="' . $model->imagen . '" class="file-preview-image">';
                            } else {
                                $preview = NULL;
                            }
                        ?>
                        <div class="col-md-12">
                            <?= $form->field($model, 'imagen')->widget(FileInput::class,[
                                    'options' => ['accept' => 'image/*', 'multiple' => false], 
                                    'pluginOptions' => [
                                        'showPreview' => true,
                                        'showCaption' => true,
                                        'caption' => $model->imagen,
                                        'initialPreviewShowDelete' => false,
                                        'initialPreviewShowFileRotate' => false,
                                        'initialPreviewConfig' => [
                                            ['caption' => $model->imagen],
                                        ],
                                        'initialCaption' => $model->imagen,
                                        'previewFileType' => 'image',
                                        'showUpload' => false, 
                                        'initialPreview' => [
                                            $preview
                                        ],
                                        'fileActionSettings' => [
                                            'showZoom' => true,
                                            'showDrag' => false,
                                            'showRemove' => false,
                                            'showUpload' => false,
                                            'showDownload' => false,
                                            'showRotate' => false,
                                        ],
                                    ],
                                ]
                            ); ?>
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
                                <?= Html::submitButton($model->isNewRecord ? '<i class="fa fa-save"></i> Guardar' : '<i class="fa fa-save"></i> Actualizar',
                                ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'name' => 'submit-button']) ?>
                                <?= Html::a('<i class="fa fa-ban"></i> Cancelar', ['index'], ['class' => 'btn btn-danger']) ?>
                    </div>
                </form>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
</div>

<?php $this->registerJs('
$(".fileinput-remove-button").click(function(){
    document.getElementById("marcas-imagendb").value = "";
});
'); ?>