<?php

namespace app\modules\ordenes\controllers;

use app\modules\clientes\models\Direcciones;
use app\modules\productos\models\Inventario;
use app\modules\productos\models\Productos;
use yii\helpers\Json;
use yii\web\Controller;

/**
 * Default controller for the `ordenes` module
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

    public function actionDirecciones()
    {
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $id = end($_POST['depdrop_parents']);
            $list = Direcciones::find()->where(['id_cliente' => $id])->asArray()->all();
            $selected = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                if (!empty($_POST['depdrop_params'])) {
                    $id1 = $_POST['depdrop_all_params']['model_id1'];
                    foreach ($list as $item) {
                        $out[] = ['id' => $item['id_direccion'], 'name' => $item['direccion']];
                        if ($item['id_direccion'] == $id1) {
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

    public function actionGetProductPrice($productId)
    {
        $product = Productos::findOne($productId);

        if ($product) {
            $price = $product->precio;
            return json_encode(['success' => true, 'price' => $price]);
        } else {
            return json_encode(['success' => false, 'message' => 'Producto no encontrado']);
        }
    }


}
