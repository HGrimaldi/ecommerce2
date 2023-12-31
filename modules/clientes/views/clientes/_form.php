<?php

use yii\helpers\Html;

use kartik\widgets\ActiveForm;
use kartik\widgets\SwitchInput;
use kartik\editors\Summernote;


/** @var yii\web\View $this */
/** @var app\modules\clientes\models\Clientes $model */
/** @var yii\widgets\ActiveForm $form */

Yii::$app->language = 'es_ES';
?>

<div class="row">
    <div class="col-md-12">

    <?php $form = ActiveForm::begin(['id'=> 'create-form'],['options' => ['enctype' => 'multipart/form-data']]); ?>
        <form role="form">
            <div class="card card-dark">
                <div class="card-header">
                    <h3 class="card-title">
                        <i class="fa fa-edit"></i>
                        Crear / Editar Registro
                    </h3>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'nombre', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'nombre', ['showLabels'=>false])->textInput(['autofocus' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'apellido', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'apellido', ['showLabels'=>false])->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'telefono', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'telefono', ['showLabels'=>false])->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'email', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'email', ['showLabels'=>false])->textInput() ?>
                        </div>
                        <div class="col-md-12">
                            <?php
                                echo $form->field($model, 'estado')->widget(SwitchInput::class, [
                                    'pluginOptions' => [
                                        'handleWidth' => 80,
                                        'onColor' => 'success',
                                        'offColor' => 'danger',
                                        'onText' => '<i class="fa fa-check"></i> Activo',
                                        'offText' => '<i class="fa fa-ban"></i> Inactivo'
                                    ]
                                ]);
                            ?>
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