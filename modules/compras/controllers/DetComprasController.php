<?php

namespace app\modules\compras\controllers;

use app\controllers\CoreController;
use app\models\Bitacora;
use app\modules\compras\models\Compras;
use app\modules\compras\models\DetCompras;
use app\modules\compras\models\DetComprasSearch;
use Exception;
use kartik\grid\EditableColumnAction;
use Ramsey\Uuid\Uuid;
use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;

/**
 * DetComprasController implements the CRUD actions for DetCompras model.
 */
class DetComprasController extends Controller
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
     * Lists all DetCompras models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new DetComprasSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DetCompras model.
     * @param int $id_det_compra Id Det Compra
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_det_compra)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_det_compra),
        ]);
    }

    /**
     * Creates a new DetCompras model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate($id_compras)
    {
        $model = new DetCompras();
        $compra = Compras::find()->where(['id_compras' => $id_compras])->one();

       /* if($model->estado == 1){
            Yii::$app->session->setFlash('danger', "LA COMPRA ya fue procesada, comuniquese con el administrador");
            return $this->redirect(['/compras/compras/view','id_compras' => $id_compras]);
        }*/

        $grid = new ActiveDataProvider(['query' => DetCompras::find()->where(
            ['id_compras' => $id_compras])]);

        $sub_total =0;
        $iva = 0;
        $total = 0;
        $retencion = 0;  
        
        $detCompras = DetCompras::find()->where(['id_compras' => $id_compras])->all();

        foreach($detCompras as $detCompras){
            $sub_total += ($detCompras->costo * $detCompras->cantidad) - ($detCompras->costo * $detCompras->cantidad) *
            ($detCompras->descuento / 100);
            $iva += (($detCompras->costo * $detCompras->cantidad) - ($detCompras->costo * $detCompras->cantidad)
            * ($detCompras->descuento / 100)) * (0.13);
            $total += (($detCompras->costo * $detCompras->cantidad) - ($detCompras->costo * 
            $detCompras->cantidad) * ($detCompras->descuento / 100)) * (1.13);
        }
        if($sub_total >= 1000){
            $retencion = $sub_total * 0.01;
        }

        if ($model->load($this->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $duplicado = DetCompras::find()->where(['id_compras' => $id_compras, 'id_producto' => 
                $model->id_producto])->one();

                if($duplicado){
                    Yii::$app->session->setFlash('warning' , 'El producto ya existe en la compra');
                    return $this->redirect(['create' , 'id_compras' => $id_compras]);
                }

                $model->id_compras = $id_compras;
                $model->uuid = Uuid::uuid4()->toString();

                if (!$model->save()) {
                    throw new Exception(
                        implode("<br>", \yii\helpers\ArrayHelper::getColumn($model->getErrors(), 0, false))
                    );
                }

                $data_original = Json::encode($model->getAttributes(),
                 JSON_PRETTY_PRINT);

                $bitacora = new Bitacora();
                $bitacora->id_registro = $model->id_det_compra;
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
            return $this->redirect(['create', 'id_compras' => $model->id_compras]);

        } else {
            return $this->render('create', [
                'model' => $model,
                'compra' => $compra,
                'grid' => $grid,
                'sub_total' => $sub_total,
                'iva' => $iva,
                'total' => $total,
                'retencion' => $retencion,
            ]);
        }
    
    }

    /**
     * Updates an existing DetCompras model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_det_compra Id Det Compra
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_det_compra)
    {
        $model = $this->findModel($id_det_compra);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_det_compra' => $model->id_det_compra]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing DetCompras model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_det_compra Id Det Compra
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_det_compra,$id_compras)
    {
        $this->findModel($id_det_compra)->delete();
        Yii::$app->session->setFlash('danger','Registro eliminado con exito');
        return $this->redirect(['create','id_compras' => $id_compras]);
    }
    public function actions()
    {
        return ArrayHelper::merge(parent::actions(),[
           'editarcantidad' => [
            'class' => EditableColumnAction::class,
            'modelClass' => DetCompras::class,
           ],
           'editarcosto' => [
            'class' => EditableColumnAction::class,
            'modelClass' => DetCompras::class,
           ], 
           'editardescuento' => [
            'class' => EditableColumnAction::class,
            'modelClass' => DetCompras::class,
           ],     
        ]);
    }

    /**
     * Finds the DetCompras model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_det_compra Id Det Compra
     * @return DetCompras the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_det_compra)
    {
        if (($model = DetCompras::findOne(['id_det_compra' => $id_det_compra])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
