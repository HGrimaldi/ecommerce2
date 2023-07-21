<?php

use app\modules\clientes\models\Clientes;
use app\modules\clientes\models\Direcciones;
use kartik\date\DatePicker;
use kartik\select2\Select2;
use kartik\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;


/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\Ordenes $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="row">
    <div class="col-md-12">
            <div class="card card-dark">
                <div class="card-header">
                    <h3 class="card-title"><i class="fa fa-edit"></i>Crear / Editar Registro</h3>
                    </div>
                    <?php $form = ActiveForm::begin(['id'=> 'crear-form'],['options' => ['enctype' => 'multipart/form-data']]); ?>
                <div class="card-body">
                <form role="form">
                    <div class="row">
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'codigo', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'codigo', ['showLabels' => false])->textInput() ?>
                        </div>
                        
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'id_cliente', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_cliente', ['showLabels' => false])->widget(Select2::class, [
                                    'data' => ArrayHelper::map(
                                        Clientes::find()->all(),
                                        'id_cliente',
                                        'nombre'
                                    ),
                                    'options' => ['placeholder' => '-Seleccionar el cliente-'],
                                    'pluginOptions' => ['allowClear' => true],
                                ]); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'id_direccion', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_direccion', ['showLabels' => false])->widget(Select2::class, [
                                    'data' => ArrayHelper::map(
                                        Direcciones::find()->all(),'id_direccion','direcion'),
                                    'options' => ['placeholder' => '-Seleccionar la direcion-'],
                                    'pluginOptions' => ['allowClear' => true],
                                ]); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'fecha', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'fecha', ['showLabels' => false])->widget(DatePicker::class, [
                                'options' => ['placeholder' => 'Seleccionar rango de fecha...'],
                                'pluginOptions' => [
                                    'autoclose' => true, 'format' => 'yyyy-m-dd',
                                    'todayHighlight' => true
                                ],
                            ]) ?>
                        </div>  
                    </div>      
                </div>
                
                <div class="card-footer">
                    <?= Html::submitButton(
                        $model->isNewRecord ? '<i class="fa fa-save"></i> Guardar' : '<i class="fa fa-save"></i> Actualizar', 
                        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
                    ) ?>
                    <?= Html::a('<i class="fa fa-ban"></i> Cancelar', ['index'], ['class' => 'btn btn-danger']) ?>
                </div>
            </div>
            </form>
        <?php ActiveForm::end(); ?>
    </div>
</div>
