<?php

use app\modules\ordenes\models\Ordenes;
use app\modules\productos\models\Productos;
use kartik\select2\Select2;
use kartik\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;


/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\DetOrdenes $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="row">
    <div class="col-md-12">
            <div class="card card-dark">
                <div class="card-header">
                    <h3 class="card-title"><i class="fa fa-edit"></i>Agregar detalle a compras</h3>
                    </div>
                    <?php $form = ActiveForm::begin(['id' => 'crear-form'], ['options' => 
                    ['enctype' => 'multipart/form-data']]); ?>
                <div class="card-body">
                    <form role="form">
                    <div class="row">
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'orden', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_orden', ['showLabels' => false])->widget(Select2::class, [
                                    'data' => ArrayHelper::map(Ordenes::find()->all(),'id_orden','codigo'),
                                    'options' => ['placeholder' => '-Seleccionar orden'],
                                    'pluginOptions' => ['allowClear' => true],
                                ]); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'producto', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_producto', ['showLabels' => false])->widget(Select2::class, [
                                    'data' => ArrayHelper::map(Productos::find()->all(),'id_producto','nombre'),
                                    'options' => ['placeholder' => '-Seleccionar producto'],
                                    'pluginOptions' => ['allowClear' => true],
                                ]); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'cantidad', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'cantidad', ['showLabels' => false])->textInput(['type' => 'number']) ?>
                        </div>
                        
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'precio', ['class' => '¨control-label']) ?>
                            <?= $form->field($model, 'precio', ['showLabels' => false, 'addon' => ['preped' => ['content' =>
                            '<span>$</span>'], ]])->textInput(['type' => 'number', 'step' => '0.01']); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'descuento', ['class' => '¨control-label']) ?>
                            <?= $form->field($model, 'descuento', ['showLabels' => false, 'addon' => ['preped' => ['content' =>
                            '<span>$</span>'], ]])->textInput(['value' => '0.00', 'type' => 'number', 'step' => '0.01']); ?>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <?= Html::submitButton(
                        $model->isNewRecord ? '<i class="fa fa-save"></i> Guardar' : '<i class="fa fa-save"></i> Actualizar',
                        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
                    ) ?>
                    <?= Html::a('<i class="fa fa-ban"></i> Cancelar', ['/ordenes/ordenes/index',
                    'id_compras' => $model->id_orden], 
                    ['class' => 'btn btn-danger']) ?>
                </div>

            </div>
            </form>
        <?php ActiveForm::end(); ?>
    </div>
</div>

