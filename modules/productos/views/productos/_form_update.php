<?php
Yii::$app->language = 'es_ES';

use app\modules\productos\models\Categorias;
use app\modules\productos\models\Marcas;
use kartik\depdrop\DepDrop;
use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\editors\Summernote;
use kartik\select2\Select2;
use kartik\widgets\FileInput;
use kartik\widgets\SwitchInput;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var app\models\Marcas $model */
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
                        <div class="col-md-4">
                            <?= Html::activeLabel($model, 'nombre', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'nombre', ['showLabels' => false])->textInput(['autofocus' => true]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= Html::activeLabel($model, 'sku', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'sku', ['showLabels' => false])->textInput(['autofocus' => true]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= Html::activeLabel($model, 'precio', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'precio', ['showLabels' => false, 'addon' => [
                                'prepend' => ['content' => '<span>$</span>'],
                            ]])->textInput(['autofocus' => true, 'type' => 'number']); ?>
                        </div>
                        <div class="col-md-4">
                            <?= Html::activeLabel($model, 'id_categoria', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_categoria', ['showLabels' => false])->widget(Select2::class, [
                                'data' => ArrayHelper::map(Categorias::find()->all(), 'id_categoria', 'nombre'),
                                'language' => 'es',
                                'options' => ['placeholder' => '- Seleccionar Categoria -'],
                                'pluginOptions' => ['allowClear' => true],
                            ]); ?>
                        </div>
                        <div class="col-md-4">
                            <?= Html::hiddenInput('model_id1', $model->isNewRecord ? '' : $model->id_categoria, ['id' => 'model_id1']); ?>
                            <?= Html::activeLabel($model, 'id_sub_categoria', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_sub_categoria', ['showLabels' => false])->widget(DepDrop::class, [
                                'language' => 'es',
                                'type' => DepDrop::TYPE_SELECT2,
                                'pluginOptions' => [
                                    'depends' => ['productos-id_categoria'],
                                    'initialize' => $model->isNewRecord ? false : true,
                                    'url' => Url::to(['/productos/sub-categorias/subcategorias']),
                                    'placeholder' => '- Seleccionar SubCategoria -',
                                    'loadingText' => 'Cargando datos...',
                                    'params' => ['model_id1']
                                ]
                            ]); ?>
                        </div>
                        <div class="col-md-4">
                            <?= Html::activeLabel($model, 'id_marca', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_marca', ['showLabels' => false])->widget(Select2::class, [
                                'data' => ArrayHelper::map(Marcas::find()->all(), 'id_marca', 'nombre'),
                                'language' => 'es',
                                'options' => ['placeholder' => '- Seleccionar Marca -'],
                                'pluginOptions' => ['allowClear' => true],
                            ]); ?>
                        </div>
                        <div class="col-md-12">
                            <?= Html::activeLabel($model, 'descripcion', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'descripcion', ['showLabels' => false])->widget(Summernote::class, [
                                'useKrajeePresets' => false,
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
                                    'placeholder' => 'Escribir descripcion del producto...',
                                ]
                            ]); ?>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group field-subir-imagen">
                                <label class="control-label" for="subir-imagen"> Imagen principal </label>
                                <div>
                                    <?= FileInput::widget([
                                        'name' => 'upload_ajax_principal',
                                        'options' => ['multiple' => false, 'accept' => 'image/*'],
                                        'pluginOptions' => [
                                            'uploadAsync' => true,
                                            'language' => 'es',
                                            'overwriteInitial' => false,
                                            'browseOnZoneClick' => true,
                                            'initialPreviewShowDelete' => true,
                                            'initialPreview' => $initialPreviewPrincipal,
                                            'encodeUrl' => false,
                                            'initialPreviewConfig' => $initialPreviewConfigPrincipal,
                                            'uploadUrl' => Url::to(['/productos/productos/upload-ajax']),
                                            'uploadExtraData' => [
                                                'id' => $model->id_producto,
                                            ],
                                            'maxFileCount' => 1,
                                            'maxFileNum' => 1,
                                        ],
                                    ]); ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group field-subir-imagen">
                                <label class="control-label" for="subir-imagenes[]"> Otras imagenes </label>
                                <div>
                                    <?= FileInput::widget([
                                        'name' => 'upload_ajax_imagenes[]',
                                        'options' => ['multiple' => true, 'accept' => 'image/*'],
                                        'pluginOptions' => [
                                            'uploadAsync' => true,
                                            'language' => 'es',
                                            'overwriteInitial' => false,
                                            'browseOnZoneClick' => true,
                                            'initialPreviewShowDelete' => true,
                                            'initialPreview' => $initialPreviewExtras,
                                            'encodeUrl' => false,
                                            'initialPreviewConfig' => $initialPreviewConfigExtras,
                                            'uploadUrl' => Url::to(['/productos/productos/upload-ajax']),
                                            'uploadExtraData' => [
                                                'id' => $model->id_producto,
                                            ],
                                            'maxFileCount' => 5,
                                            'maxFileNum' => 5,
                                        ],
                                    ]); ?>
                                </div>
                            </div>
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

<?php $this->registerJs('
$(".fileinput-remove-button").click(function(){
    document.getElementById("marcas-imagendb").value = "";
});
'); ?>