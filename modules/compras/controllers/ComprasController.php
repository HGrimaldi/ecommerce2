<?php

namespace app\modules\compras\controllers;

use app\controllers\CoreController;
use app\models\Bitacora;
use app\models\DetCompras;
use app\modules\compras\models\Compras;
use app\modules\compras\models\ComprasSearch;
use app\modules\inventario\models\Inventario;
use app\modules\inventario\models\Kardex;
use Exception;
use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Json;

/**
 * ComprasController implements the CRUD actions for Compras model.
 */
class ComprasController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::class,
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Compras models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ComprasSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Compras model.
     * @param int $id_compras Id Compras
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_compras)
    {
        $model = $this->findModel($id_compras);
        $grid = new ActiveDataProvider(['query' => DetCompras::find()->where(
            ['id_compras' => $id_compras])]);
            $detCompras = DetCompras::find()->where(['id_compras' => $id_compras])->all();

        $sub_total =0;
        $iva = 0;
        $total = 0;
        $retencion = 0;  
        

        foreach($detCompras as $detCompras){
            $sub_total += ($detCompras->costo * $detCompras->cantidad) - ($detCompras->costo * $detCompras->cantidad) *
            ($detCompras->descuento / 100);
            $iva += (($detCompras->costo * $detCompras->cantidad) - ($detCompras->costo * $detCompras->cantidad)
            * ($detCompras->descuento / 100)) * (0.13);
            $total += (($detCompras->costo * $detCompras->cantidad) - ($detCompras->costo * 
            $detCompras->cantidad) * ($detCompras->descuento / 100)) * (1.13);
        }
        if($sub_total >= 100){
            $retencion = $sub_total * 0.01;
        }
        return $this->render('view', [
            'compra' => $model,
            'grid' => $grid,
            'sub_total' => $sub_total,
            'iva' => $iva,
            'total' => $total,
            'retencion' => $retencion,
        ]);
    }

    /**
     * Creates a new Compras model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Compras();

        if ($model->load($this->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model->codigo = $this->CreateCodigo();
                $model->anulado = 0;
                $model->estado = 0;

                if (!$model->save()) {
                    throw new Exception(
                        implode("<br>", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0, false))
                    );
                }

                $data_original = Json::encode($model->getAttributes(),
                 JSON_PRETTY_PRINT);

                $bitacora = new Bitacora();
                $bitacora->id_registro = $model->id_compras;
                $bitacora->controlador = $controller = Yii::$app->controller->id;
                $bitacora->accion = Yii::$app->controller->action->id;
                $bitacora->data_original = $data_original;
                $bitacora->data_modificada = NULL;
                $bitacora->id_usuario = Yii::$app->user->identity->id;
                $bitacora->fecha = $model->fecha_mod;

                if (!$bitacora->save()) {
                    throw new Exception(
                        implode("<br>", \yii\helpers\ArrayHelper::getColumn($bitacora->getErrors(), 0, false))
                    );
                }

                $transaction->commit();

            } catch (Exception $e) {
                $transaction->rollBack();
                $controller = Yii::$app->controller->id . "/" . Yii::$app->controller->action->id;
                CoreController::getErrorLog(\Yii::$app->user->identity->id, $e, $controller);
                return $this->redirect(['index']);
            }

            Yii::$app->session->setFlash('success', "Registro creado exitosamente.");
            return $this->redirect(['det-compras/create', 'id_compras' => $model->id_compras]);

        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }
    function CreateCodigo(){
        $compra = Compras::find()->orderBy(['id_compras' => SORT_DESC])->one();
        if(empty($compra->codigo)) $codigo = 0;
        else $codigo = $compra->codigo;

        $int = intval(preg_replace('/[^0-9]+/','',$codigo), 10);
        $id = $int + 1;
        $numero = $id;
        $tmp = "";
        if($id< 10){
            $tmp.= "0000";
            $tmp.= $id;
        }else if($id >= 10 && $id < 100){
            $tmp.= "000";
            $tmp.= $id;
        }else if($id >= 100 && $id < 1000){
            $tmp.= "00";
            $tmp.= $id;
        }else if($id >= 1000 && $id < 10000){
            $tmp.= "0";
            $tmp.= $id;
        }
        else {
            $tmp .= $id;
        }
        $result = str_replace($id, $tmp, $numero);
        return "CMPR-" . $result;    
    }

    /**
     * Updates an existing Compras model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_compras Id Compras
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_compras)
    {
        $model = $this->findModel($id_compras);

        if($model->estado == 1){
            Yii::$app->session->setFlash('danger', "LA COMPRA ya fue procesada, comuniquese con el administrador");
            return $this->redirect(['view','id_compras' => $id_compras]);
        }

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_compras' => $model->id_compras]);
        }
        

        return $this->render('update', [
            'model' => $model,
        ]);
    }
    public function actionInventario($id_compras){

        $model = $this->findModel($id_compras);

        if($model->estado == 1){
            Yii::$app->session->setFlash('danger', "LA COMPRA ya fue procesada, comuniquese con el administrador");
            return $this->redirect(['view','id_compras' => $id_compras]);
        }
        
        $detCompras = DetCompras::find()->where('id_compras =' . $id_compras)->all();
        $transaction = Yii::$app->db->beginTransaction();
        try{
            foreach($detCompras as $det){
                $modelInventario = new Inventario();
                $modelInventario->uuid = $det->uuid;
                $modelInventario->id_producto = $det->id_producto;
                $modelInventario->existencia = $det->cantidad;
                $modelInventario->existencia_original = $det->cantidad;

                if(!$modelInventario->save()){
                    throw new Exception(
                        implode("<br>", \yii\helpers\ArrayHelper::getColumn($modelInventario->getErrors(), 0,
                         false)));
                }
                $modelKardex = new Kardex();
                $modelKardex->id_documento = $id_compras;
                $modelKardex->cod_documento = $model->codigo;
                $modelKardex->num_documento = $model->num_factura;
                $modelKardex->tipo_documento = 'COMPRA';
                $modelKardex->id_producto = $det->id_producto;
                $modelKardex->cantidad = $det->cantidad;
                $modelKardex->uuid = $det->uuid;

                if(!$modelKardex->save()){
                    throw new Exception(
                        implode("<br>", \yii\helpers\ArrayHelper::getColumn($modelKardex->getErrors(), 0,
                         false)));
                }
            }
            $model->estado = 1;
            $data_original = Json::encode($model->getOldAttributes(),JSON_PRETTY_PRINT);
            $data_modificada = Json::encode($model->getDirtyAttributes(),JSON_PRETTY_PRINT);

            if(!$model->save()){
                throw new Exception(
                    implode("<br>", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0,
                     false)));
            }
            
            $bitacora = new Bitacora();
            $bitacora->id_registro = $model->id_compras;
            $bitacora->controlador = $controller = Yii::$app->controller->id;
            $bitacora->accion = Yii::$app->controller->action->id;
            $bitacora->data_original = $data_original;
            $bitacora->data_modificada = $data_modificada;
            $bitacora->id_usuario = Yii::$app->user->identity->id;
            $bitacora->fecha = $model->fecha_mod;

            if (!$bitacora->save()) {
                throw new Exception(
                    implode("<br>", \yii\helpers\ArrayHelper::getColumn($bitacora->getErrors(), 0, false))
                );
            }

            $transaction->commit();
        }catch(Exception $e) {
            $transaction->rollBack();
            $controller = Yii::$app->controller->id . "/" . Yii::$app->controller->action->id;
            CoreController::getErrorLog(\Yii::$app->user->identity->id, $e, $controller);
            return $this->redirect(['view', 'id_compras' => $id_compras]);
        }
        Yii::$app->session->setFlash('success', "Registro actualizado exitosamente.");
        return $this->redirect(['view', 'id_compras' => $model->id_compras]);

    }

    /**
     * Deletes an existing Compras model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_compras Id Compras
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_compras)
    {
        $this->findModel($id_compras)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Compras model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_compras Id Compras
     * @return Compras the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_compras)
    {
        if (($model = Compras::findOne(['id_compras' => $id_compras])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
