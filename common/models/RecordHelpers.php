<?php

namespace common\models;

use yii;

Class RecordHelpers {

    public static function userHas($model_name) {
        $connection = \Yii::$app->db;
        $userid = Yii::$app->user->identity->id;
        //error_log('DEBUG JAVIER  $userid '.$userid);
        $sql = "SELECT id FROM $model_name WHERE user_id=:userid";
        $command = $connection->createCommand($sql);
        $command->bindValue(":userid", $userid);
        $result = $command->queryOne();
        if ($result == null) {
            return false;
        } else {
          //  error_log('DEBUG JAVIER result[id] '.$result['id']);
            return $result['id'];
        }
    }

}
