<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\clientes\models\Direcciones $model */

$this->title = 'Editar Registro ';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => 'Detalle', 'url' => ['view', 'id_direccion'
 => $model->id_direccion]];
 $this->params['breadcrumbs'][] = $this->title;
?>
<div class="direcciones-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
