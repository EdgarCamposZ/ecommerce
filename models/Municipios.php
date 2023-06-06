<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_municipios".
 *
 * @property int $id_municipio
 * @property int $id_departamento
 * @property string $nombre
 * @property string $codigo
 *
 * @property Departamentos $departamento
 * @property Proveedores[] $tblProveedores
 */
class Municipios extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_municipios';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_departamento', 'nombre', 'codigo'], 'required'],
            [['id_departamento'], 'integer'],
            [['nombre'], 'string', 'max' => 125],
            [['codigo'], 'string', 'max' => 5],
            [['id_departamento'], 'exist', 'skipOnError' => true, 'targetClass' => Departamentos::class, 'targetAttribute' => ['id_departamento' => 'id_departamento']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_municipio' => 'Id Municipio',
            'id_departamento' => 'Id Departamento',
            'nombre' => 'Nombre',
            'codigo' => 'Codigo',
        ];
    }

    /**
     * Gets query for [[Departamento]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDepartamento()
    {
        return $this->hasOne(Departamentos::class, ['id_departamento' => 'id_departamento']);
    }

    /**
     * Gets query for [[Proveedores]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblProveedores()
    {
        return $this->hasMany(Proveedores::class, ['id_municipio' => 'id_municipio']);
    }
}
