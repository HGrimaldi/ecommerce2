<?php

use kartik\grid\GridView;
use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\Ordenes $model */

$this->title = 'Detalle ';
$this->params['breadcrumbs'][] = ['label' => 'Ordenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="row">
    <div class="col-md-8">
        <div class="card card-outline card-dark">
            <div class="card-header">
                <h3 class="card-title">Datos de orden</h3>
            </div>
            <div class="card-body">
                <table class="table table-sm table-striped table-hover table-bordered">
                <tr>
                    
                    <td width="20%"><b>codigo</b></td>  
                    <td width="30%"><span class="badge bg-purple">
                    <?= $model->codigo?></span></td> 
                    <td width="20%"><b>Cliente</b></td>  
                    <td width="30%"><span class="badge bg-purple">
                    <?= $model->cliente->nombre?></span></td> 
                </tr>
                <tr>
                    <td><b>Tipo de compra</b></td>
                    <td><?= $model->estado == 0? "Credito" : "Contado";?></td>
                    <td><b>Direccion</b></td>
                    <td><?= $model->direccion->direcion?></td>
                </tr>
                <tr>
                    <td><b>Fecha</b></td>
                    <td><?= $model->fecha?></td>
                    <td><b>Estado</b></td>
                    <td><span class="badge bg-<?= $model->estado == 0?"warning"
                    : "red";?>"><?= $model->estado == 0? "Sin procesar":
                    "Procesada";?></span></td>
                </tr>
                <tr>
                    
                </tr>
                </table>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-md-6 text-left">
                        <?php if($model->estado == 0){
                            echo Html::a('<i class="fa fa-edit"></i> Editar',['update', 'id_orden' => $model->id_orden],
                            ['class' => 'btn btn-primary', 'data-toggle' => 'tooltip','title' => 'Edit record']);

                        }else{
                            echo Html::a('<i class="fa fa-edit"></i> Editar',['update', 'id_orden' => $model->id_orden],
                            ['class' => 'btn btn-primary disabled', 'data-toggle' => 'tooltip','title' => 'Edit record']);
                            } ?>
                            <?php echo Html::a('<i class="fa fa-edit"></i> Cancelar',['index'],['class' => 'btn btn-danger',
                            'data-toggle'=> 'tooltip','title' => 'cancelar'])?>
                    </div>
                    <div class="col-md-6 text-right">
                            <?php if($model->estado == 0){
                                echo Html::a('<i class="fa fa-plus"></i> Agregar Items',['/ordenes/det-ordenes/create',
                                'id_orden' => $model->id_orden],['class' => 'btn btn-info','data-toggle' => 'tooltip', 
                                'title' => 'Edit record']);
                            }else{
                                echo Html::a('<i class="fa fa-plus"></i> Agregar Items',
                                ['/ordenes/det-ordenes/create','id_orden' => $model->id_orden],
                                ['class' => 'btn btn-info disabled','data-toggle' => 'tooltip', 'title' => 'Edit record']);
                            }?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
    <div class="col-md-12">
        <div class="det-compras-index">

            <?php
                $gridColumns = [
                    [
                        'class' => 'kartik\grid\SerialColumn',
                        'contentOptions' => ['class' => 'kartik-sheet-style'],
                        'width' => '150px',
                        'header' => '#',
                        'headerOptions' => ['class' => 'kartik-sheet-style']
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'id_producto',
                        'vAlign' => 'middle',
                        'width' => '150px',
                        'format' => 'html',
                        'value' => function ($model) {
                           return $model->producto->nombre;
                        },
                        'pageSummary' => 'Total',
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'cantidad',
                        'hAlign' => 'right',
                        'width' => '150px',
                        'vAlign' => 'middle',
                        'pageSummary' => true,
                        'filter' => false,
                    ], 
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'costo',
                        'hAlign' => 'right',
                        'width' => '150px',
                        'vAlign' => 'middle',
                        'width' => '150px',
                        'pageSummary' => true,
                        'filter' => false,
                    ], 
                    
                    [
                        'class' => 'kartik\grid\FormulaColumn',
                        'attribute' => 'descuento',
                        'width' => '150px',
                        'vAlign' => 'middle',
                        'value' => function($model, $key, $index, $widget){
                            $p = compact('model', 'key', 'index');
                            return ($widget->col(2, $p) * $widget->col(3,$p)) * ($widget->col(4,$p)/100);
                        }
                    ],
                    [
                        'class' => 'kartik\grid\FormulaColumn',
                        'header' => 'Total Descuento',
                        'width' => '150px',
                        'vAlign' => 'middle',
                        'value' => function($model,$key, $index,$widget){
                            $p = compact('model','key','index');
                            return ($widget->col(2,$p) * $widget->col(3,$p)) * ($widget->col(4,$p)/100);
                        },
                        'headerOptions' => ['class' => 'kartik-sheet-style'],
                        'vAlign' => 'right',
                        'width' => '15%',
                        'mergeHeader' => true,
                        'pageSummary' => true,
                        'footer' => true,
                        //'format' => 'currency',
                    ],
                    [
                        'class' => 'kartik\grid\FormulaColumn',
                        'header' => 'Sub-Total',
                        'vAlign' => 'middle',
                        'value' => function($model,$key, $index,$widget){
                            $p = compact('model','key','index');
                            return ($widget->col(2,$p) * $widget->col(3,$p)) - ($widget->col(5,$p));
                        },
                        'headerOptions' => ['class' => 'kartik-sheet-style'],
                        'vAlign' => 'right',
                        'width' => '10%',
                        'mergeHeader' => true,
                        'pageSummary' => true,
                        'footer' => true,
                        //'format' => 'currency',
                    ],
                    [
                        'class' => 'kartik\grid\FormulaColumn',
                        'header' => 'IVA',
                        'vAlign' => 'middle',
                        'value' => function($model,$key, $index,$widget){
                            $p = compact('model','key','index');
                            return ($widget->col(6,$p) * 0.13);
                        },
                        'headerOptions' => ['class' => 'kartik-sheet-style'],
                        'vAlign' => 'right',
                        'width' => '10%',
                        'mergeHeader' => true,
                        'pageSummary' => true,
                        'footer' => true,
                        //'format' => 'currency',
                    ],
                    [
                        'class' => 'kartik\grid\FormulaColumn',
                        'header' => 'Total',
                        'vAlign' => 'middle',
                        'value' => function($model,$key, $index,$widget){
                            $p = compact('model','key','index');
                            return ($widget->col(6,$p) + $widget->col(7, $p));
                        },
                        'headerOptions' => ['class' => 'kartik-sheet-style'],
                        'vAlign' => 'right',
                        'width' => '10%',
                        'mergeHeader' => true,
                        'pageSummary' => true,
                        'footer' => true,
                        //'format' => 'currency',
                    ],
                    /*[
                        'class' => 'kartik\grid\ActionColumn',
                        'header' => 'Acciones',
                        'template' => '{delete}',
                        'width' => '80px',
                        'vAlign' => GridView::ALIGN_BOTTOM,
                        'buttons' => [
                            'delete' => function($url){
                                return Html::a('<span class="fa fa-trash-alt" style="color:red"></span>', $url,[
                                    'title' => Yii::t('app','Delete'),
                                    'data-confirm' => Yii::t('yii','Estas seguro de borrar este registro?'),
                                    'data-method' => 'post', 'data-pjax' => '0',
                                ]);
                            }
                        ],
                        'urlCreator' => function($action, $model){
                            if($action == 'delete'){
                                $url = Url::to(['/compras/det-compras/delete','id_det_compra' =>
                                $model -> id_det_compra,'id_compras' => $model->id_compras]);
                                return $url;
                            }
                        }
                    ],*/
                   
                ];

            
                echo GridView::widget([
                    'id' => 'kv-sub-compras',
                    'dataProvider' => $grid,
                    'columns' => $gridColumns,
                    'containerOptions' => ['style' => 'overflow: auto'], // only set when $responsive = false
                    'headerRowOptions' => ['class' => 'kartik-sheet-style'],
                    'filterRowOptions' => ['class' => 'kartik-sheet-style'],
                    'pjax' => true, // pjax is set to always true for this demo
                    // set your toolbar
                    'toolbar' =>  [
                    ],
                    'toggleDataContainer' => ['class' => 'btn-group mr-2'],
                    // set export properties
                    // parameters from the demo form
                    'bordered' => true,
                    'striped' => true,
                    'condensed' => true,
                    'responsive' => true,
                    'hover' => true,
                    'showPageSummary'=>true,
                    'panel' => [
                        'type' => 'dark',
                        'heading' => '',
                    ],
                    'persistResize' => false,
                ]);
            ?>
        </div>
    </div>
</div>
