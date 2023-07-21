<?php

namespace app\modules\ordenes\models;

use app\models\Usuarios;
use app\modules\clientes\models\Clientes;
use app\modules\clientes\models\Direcciones;
use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "tbl_ordenes".
 *
 * @property int $id_orden
 * @property string $codigo
 * @property int $id_cliente
 * @property int $id_direccion
 * @property string $fecha
 * @property int $anulado
 * @property string|null $fecha_ing
 * @property int|null $id_usuario_ing
 * @property string|null $fecha_mod
 * @property int|null $id_usuario_mod
 * @property int $estado
 *
 * @property Clientes $cliente
 * @property Direcciones $direcion
 * @property DetOrdenes[] $tblDetOrdenes
 * @property Ventas[] $tblVentas
 * @property Usuarios $usuarioIng
 * @property Usuarios $usuarioMod
 */
class Ordenes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_ordenes';
    }
    public function behaviors() {
        return [
            [
                'class' => TimestampBehavior::class,
                'createdAtAttribute'=>'fecha_ing',
                'updatedAtAttribute'=>'fecha_mod',
                'value'=> date('Y-m-d H:i:s')
            ],
            [
                'class' =>BlameableBehavior::class,
                'createdByAttribute'=>'id_usuario_ing',
                'updatedByAttribute'=>'id_usuario_mod'
            ]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['codigo', 'id_cliente', 'id_direccion', 'fecha', 'anulado', 'estado'], 'required'],
            [['id_cliente', 'id_direccion', 'anulado', 'id_usuario_ing', 'id_usuario_mod', 'estado'], 'integer'],
            [['fecha', 'fecha_ing', 'fecha_mod'], 'safe'],
            [['codigo'], 'string', 'max' => 10],
            [['id_cliente'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Clientes::class, 'targetAttribute' => ['id_cliente' => 'id_cliente']],
            [['id_direccion'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Direcciones::class, 'targetAttribute' => ['id_direccion' => 'id_direccion']],
            [['id_usuario_ing'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Usuarios::class, 'targetAttribute' => ['id_usuario_ing' => 'id_usuario']],
            [['id_usuario_mod'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Usuarios::class, 'targetAttribute' => ['id_usuario_mod' => 'id_usuario']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_orden' => 'Id',
            'codigo' => 'Codigo',
            'id_cliente' => 'Cliente',
            'id_direccion' => 'direcion',
            'fecha' => 'Fecha',
            'anulado' => 'Anulado',
            'fecha_ing' => 'Fecha Ingreso',
            'id_usuario_ing' => 'Ingresado por',
            'fecha_mod' => 'Fecha Modificacion',
            'id_usuario_mod' => 'Modificado por',
            'estado' => 'Estado',
        ];
    }

    /**
     * Gets query for [[Cliente]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Clientes::class, ['id_cliente' => 'id_cliente']);
    }

    /**
     * Gets query for [[direcion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDireccion()
    {
        return $this->hasOne(Direcciones::class, ['id_direccion' => 'id_direccion']);
    }

    /**
     * Gets query for [[TblDetOrdenes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblDetOrdenes()
    {
        return $this->hasMany(DetOrdenes::class, ['id_orden' => 'id_orden']);
    }

    /**
     * Gets query for [[TblVentas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblVentas()
    {
        return $this->hasMany(Ventas::class, ['id_orden' => 'id_orden']);
    }

    /**
     * Gets query for [[UsuarioIng]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioIng()
    {
        return $this->hasOne(Usuarios::class, ['id_usuario' => 'id_usuario_ing']);
    }

    /**
     * Gets query for [[UsuarioMod]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioMod()
    {
        return $this->hasOne(Usuarios::class, ['id_usuario' => 'id_usuario_mod']);
    }
}
