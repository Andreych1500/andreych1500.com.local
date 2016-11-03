<?php
if(isset($_GET['add'])){
    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['symbol_code'] = (empty($_POST['symbol_code'])? 'class="error"' : '');

        $primary = q("
            SELECT `symbol_code`
            FROM  `admin_shares`
            WHERE `symbol_code` = '".mres($_POST['symbol_code'])."'
            LIMIT 1
        ");

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);
            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];
            $_POST['sort'] = (!isset($_POST['sort'])? 100 : $_POST['sort']);

            q("
                INSERT INTO `admin_shares` SET
                `sort`        = ".(int)$_POST['sort'].",
                `active`      = ".$_POST['active'].",
                `name`        = '".$_POST['name']."',
                `symbol_code`  = '".$_POST['symbol_code']."',
                `user_custom` = '".$_SESSION['user']['last_name'].' '.$_SESSION['user']['name']."',
                `date_create` = NOW()
            ");

            sessionInfo('/admin/sections/shares/', $messG['Елемент створено успішно!'], 1);
        }
    }
} elseif(isset($_GET['edit'])) {

    if(isset($_POST['ok'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['end'] = (empty($_POST['end'])? 'class="error"' : '');


        $primary = q("
            SELECT `symbol_code`
            FROM  `admin_type_mails`
            WHERE `symbol_code` = '".mres($_POST['symbol_code'])."' 
            AND `id` != ".(int)$_REQUEST['edit']."
            LIMIT 1
        ");

        if($primary->num_rows > 0){
            $check['symbol_code'] = 'class="error"';
        }

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);
            $_POST['active'] = !isset($_POST['active'])? 0 : (int)$_POST['active'];
            $_POST['sort'] = (!isset($_POST['sort'])? 100 : $_POST['sort']);

            if(strlen(explode('T', $_POST['start'])[1]) == 5){
                $_POST['start'] .= ':00';
            }

            if(strlen(explode('T', $_POST['end'])[1]) == 5){
                $_POST['end'] .= ':00';
            }

            q("
                UPDATE `admin_shares` SET
                `active`      = ".$_POST['active'].",
                `sort`        = ".(int)$_POST['sort'].",
                `name`        = '".$_POST['name']."',
                `symbol_code` = '".$_POST['symbol_code']."',
                `start`       = '".$_POST['start']."',
                `end`         = '".$_POST['end']."',
                `user_custom` = '".$_SESSION['user']['last_name'].' '.$_SESSION['user']['name']."',
                `date_custom` = NOW()
                 WHERE `id` = ".(int)$_GET['edit']."
            ");

            sessionInfo('/admin/sections/shares/', $messG['Редагування пройшло успішно!'], 1);
        }
    }

    $arResult = q("
        SELECT *
        FROM `admin_shares`
        WHERE `id` = ".(int)$_GET['edit']."
    ");

    if($arResult->num_rows == 0){
        sessionInfo('/admin/sections/shares/', $messG['Eлемент з таким ID неіснує!']);
    } else {
        $arResult = hsc($arResult->fetch_assoc());
    }
} else {
    if(isset($_GET['ajax'], $_GET['dynamicEditHtml'])){
        AdminFunction::dynamicEditHtml($_POST, 'admin_shares', '/admin/sections/shares/');
    } elseif(isset($_POST['arr']) && count($_POST['arr']) > 0) {
        AdminFunction::dynamicEditQuery($_POST['arr'], 'admin_shares', '/admin/sections/shares/', array(
            $messG['Редагування пройшло успішно!'],
        ));
    } elseif(isset($_GET['delete']) || isset($_POST['delete'])) { // Delete
        $ids = (isset($_POST['ids'])? implode(',', $_POST['ids']) : $_GET['delete']);
        if($ids != $messG['Видалити']){
            AdminFunction::deleteEl($ids, 'admin_shares', '/admin/sections/shares/', $messG['Видалення пройшло успішно!']);
        }
    } elseif(isset($_POST['deactivate']) && isset($_POST['ids'])) { // Deactivate
        AdminFunction::deactivateEl(implode(',', $_POST['ids']), 'admin_shares', '/admin/sections/shares/', $messG['Деактивація пройшла успішно!']);
    } elseif(isset($_POST['activate']) && isset($_POST['ids'])) { // Activate
        AdminFunction::activeEl(implode(',', $_POST['ids']), 'admin_shares', '/admin/sections/shares/', $messG['Активація пройшла успішно!']);
    }

    // Filter
    if(isset($_GET['filterReset'])){
        header('Location: /admin/sections/shares/');
    }

    $shares = AdminFunction::StructureMenu(array(
        'db_table'   => "admin_shares",
        'url'        => "/admin/sections/shares/",
        'numPage'    => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
        'pagination' => array(
            'count_show' => 5,
            'css_class'  => "pagination-admin",
        ),
        'filter'     => (!isset($_GET['filter'])? false : true),
    ));
}