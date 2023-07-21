<?php

namespace app\modules\ordenes\controllers;

use app\models\DetCompras;
use app\modules\ordenes\models\DetOrdenes;
use app\modules\ordenes\models\DetOrdenesSearch;
use app\modules\ordenes\models\Ordenes;
use app\modules\productos\models\Productos;
use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DetOrdenesController implements the CRUD actions for DetOrdenes model.
 */
class DetOrdenesController extends Controller
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
     * Lists all DetOrdenes models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new DetOrdenesSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DetOrdenes model.
     * @param int $id_det_orden Id Det Orden
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_det_orden)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_det_orden),
        ]);
    }

    /**
     * Creates a new DetOrdenes model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate($id_orden)
    {
        $model = new DetOrdenes();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_det_orden' => $model->id_det_orden]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
        

    }

    /**
     * Updates an existing DetOrdenes model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_det_orden Id Det Orden
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_det_orden)
    {
        $model = $this->findModel($id_det_orden);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_det_orden' => $model->id_det_orden]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing DetOrdenes model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_det_orden Id Det Orden
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_det_orden)
    {
        $this->findModel($id_det_orden)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the DetOrdenes model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_det_orden Id Det Orden
     * @return DetOrdenes the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_det_orden)
    {
        if (($model = DetOrdenes::findOne(['id_det_orden' => $id_det_orden])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
