<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\DetOrdenes $model */

$this->title = 'Update Det Compras: ' . $model->id_det_compra;
$this->params['breadcrumbs'][] = ['label' => 'Det Ordenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_det_orden, 'url' => ['view', 'id_det_orden' => $model->id_det_orden]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="det-ordenes-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
