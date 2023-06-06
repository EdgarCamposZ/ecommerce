<?php

namespace app\modules\compras\controllers;

use app\models\Municipios;
use yii\helpers\Json;
use yii\web\Controller;

/**
 * Default controller for the `compras` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionMunicipios()
    {
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $id = end($_POST['depdrop_parents']);
            $list = Municipios::find()->where(['id_departamento' => $id])->asArray()->all();
            $selected = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                if (!empty($_POST['depdrop_params'])) {
                    $id1 = $_POST['depdrop_all_params']['model_id1'];
                    foreach ($list as $item) {
                        $out[] = ['id' => $item['id_municipio'], 'name' => $item['nombre']];
                        if ($item['id_municipio'] == $id1) {
                            $selected = $id1;
                        }
                    }
                }
                return Json::encode(['output' => $out, 'selected' => $selected]);
                return;
            }
        }
        return Json::encode(['output' => '', 'selected' => '']);
    }
}
