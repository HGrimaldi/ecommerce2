<?php

Yii::$app->language = 'es_ES';

use app\modules\compras\models\Compras;
use app\modules\compras\models\Proveedores;
use kartik\export\ExportMenu;
use kartik\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;



/** @var yii\web\View $this */
/** @var app\models\ProveedoreSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Listado de Compras';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row">
    <div class="col-md-12">
        <div class="tbl-sub-categorias-index">

            <?php
                $gridColumns = [
                    [
                        'class' => 'kartik\grid\SerialColumn',
                        'contentOptions' => ['class' => 'kartik-sheet-style'],
                        'width' => '36px',
                        'header' => '#',
                        'headerOptions' => ['class' => 'kartik-sheet-style']
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'width' => '80px',
                        'format' => 'raw',
                        'vAlign' => 'middle',
                        'hAlign' => 'center',
                        'attribute' => 'id_compras',
                        'value' => function ($model, $key, $index, $widget) {
                            return Html::tag('span', $model->id_compras, ['class' => 'badge bg-purple']);
                        },
                        'filter' => false,
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'codigo',
                        'width' => '250px',
                        'vAlign' => 'middle',
                        'format' => 'html',
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'num_factura',
                        'width' => '250px',
                        'vAlign' => 'middle',
                        'format' => 'html',
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'id_proveedor',
                        'vAlign' => 'middle',
                        'format' => 'html',
                        'value' => function ($model, $key, $index, $widget) {
                            return Html::a($model->proveedor->nombre,  ['view', 'id_proveedor' => $model->id_proveedor]);
                        },
                        'filterType' => GridView::FILTER_SELECT2,
                        'filter' => ArrayHelper::map(Proveedores::find()->orderBy('id_proveedor')->all(), 'nombre', 'nombre'),
                        'filterWidgetOptions' => [
                            'options' => ['placeholder' => 'Todos...'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ],
                    ],
                    [
                        'attribute' => 'fecha_ing',
                        'vAlign' => 'middle',
                        'width' => '250px',
                        'value' => function($model) {
                            return date('d-m-y', strtotime($model->fecha_ing));
                        },
                        'filterType' => GridView::FILTER_DATE_RANGE,
                        'filterWidgetOptions' => ([
                            'model' => $searchModel,
                            'attribute' => 'fecha_ing',
                            'presetDropdown' => true,
                            'hideInput' => true,
                            'defaultPresetValueOptions' => ['style' => 'display: none'],
                            'convertFormat' => true,
                            'readonly' => true,
                            'options'=>[
                                'placeholder' => 'Selecciona el rango'
                            ],
                            'pluginOptions' => [
                                'locale' => ['format' => 'Y-m-d'],
                                'opens' => 'left'
                            ],
                        ]),
                    ],
                    [
                        'class' => 'kartik\grid\BooleanColumn',
                        'trueLabel' => 'Si',
                        'falseLabel' => 'No',
                        'attribute' => 'estado',
                        'width' => '120px',
                        'filterType' => GridView::FILTER_SELECT2,
                        'filterWidgetOptions' => [
                            'options' => ['placeholder' => 'Todos...'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ],
                        'vAlign' => 'middle',
                    ],
                    [
                        'class' => 'kartik\grid\ActionColumn',
                        'header' => 'Acciones',
                        'urlCreator' => function ($action, Compras $model, $key, $index, $column) {
                            return Url::toRoute([$action, 'id_compras' => $model->id_compras]);
                        }
                    ],
                  
                ];

                $exportmenu = ExportMenu::widget([
                    'dataProvider' => $dataProvider,
                    'columns' => $gridColumns,
                    'exportConfig' => [
                        ExportMenu::FORMAT_TEXT => false,
                        ExportMenu::FORMAT_HTML => false,
                        ExportMenu::FORMAT_CSV => false,
                    ],
                ]);

                echo GridView::widget([
                    'id' => 'kv-compras',
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'columns' => $gridColumns,
                    'containerOptions' => ['style' => 'overflow: auto'], // only set when $responsive = false
                    'headerRowOptions' => ['class' => 'kartik-sheet-style'],
                    'filterRowOptions' => ['class' => 'kartik-sheet-style'],
                    'pjax' => true, // pjax is set to always true for this demo
                    // set your toolbar
                    'toolbar' =>  [
                        [
                            'content' =>
                            Html::a('<i class="fas fa-plus"></i> Agregar', ['create'], [
                                'class' => 'btn btn-success',
                                'data-pjax' => 0,
                            ]) . ' ' .
                                Html::a('<i class="fas fa-redo"></i>', ['index'], [
                                    'class' => 'btn btn-outline-success',
                                    'data-pjax' => 0,
                                ]),
                            'options' => ['class' => 'btn-group mr-2']
                        ],
                        $exportmenu,
                        '{toggleData}',
                    ],
                    'toggleDataContainer' => ['class' => 'btn-group mr-2'],
                    // set export properties
                    // parameters from the demo form
                    'bordered' => true,
                    'striped' => true,
                    'condensed' => true,
                    'responsive' => true,
                    'hover' => true,
                    //'showPageSummary'=>$pageSummary,
                    'panel' => [
                        'type' => 'dark',
                        'heading' => 'Listado de Proveedores',
                    ],
                    'persistResize' => false,
                ]);
            ?>
        </div>
    </div>
</div>