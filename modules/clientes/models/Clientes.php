<?php

namespace app\modules\clientes\models;

use app\models\Usuarios;
use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "tbl_clientes".
 *
 * @property int $id_cliente
 * @property string $nombre
 * @property string $apellido
 * @property string $telefono
 * @property string $email
 * @property string|null $fecha_ing
 * @property int|null $id_usuario_ing
 * @property string|null $fecha_mod
 * @property int|null $id_usuario_mod
 * @property int $estado
 *
 * @property Direcciones[] $tblDirecciones
 * @property Usuarios $usuarioIng
 * @property Usuarios $usuarioMod
 */
class Clientes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_clientes';
    }

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::class,
                'createdAtAttribute' => 'fecha_ing',
                'updatedAtAttribute' => 'fecha_mod',
                'value' => date('Y-m-d H:i:s')
            ], [
                'class' => BlameableBehavior::class,
                'createdByAttribute' => 'id_usuario_ing',
                'updatedByAttribute' => 'id_usuario_mod',

            ]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'apellido', 'telefono', 'email', 'estado'], 'required'],
            [['fecha_ing', 'fecha_mod'], 'safe'],
            [['id_usuario_ing', 'id_usuario_mod', 'estado'], 'integer'],
            [['nombre', 'apellido'], 'string', 'max' => 100],
            [['telefono'], 'string', 'max' => 11],
            [['email'], 'string', 'max' => 200],
            [['id_usuario_ing'], 'exist', 'skipOnError' => true, 'targetClass' => Usuarios::class, 'targetAttribute' => ['id_usuario_ing' => 'id_usuario']],
            [['id_usuario_mod'], 'exist', 'skipOnError' => true, 'targetClass' => Usuarios::class, 'targetAttribute' => ['id_usuario_mod' => 'id_usuario']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_cliente' => 'Id',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'telefono' => 'Telefono',
            'email' => 'Email',
            'fecha_ing' => 'Fecha Ing',
            'id_usuario_ing' => 'Id Usuario Ing',
            'fecha_mod' => 'Fecha Mod',
            'id_usuario_mod' => 'Id Usuario Mod',
            'estado' => 'Estado',
        ];
    }

    /**
     * Gets query for [[Direcciones]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblDirecciones()
    {
        return $this->hasMany(Direcciones::class, ['id_cliente' => 'id_cliente']);
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
