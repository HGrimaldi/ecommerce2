<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\ordenes\models\DetOrdenes $model */

$this->title = 'Agregar detalle ordenes';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['ordenes/index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="det-ordenes-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
