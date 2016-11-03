<?php
if(isset($_REQUEST['ajax'], $_REQUEST['dynamicEditHtml'])){
    AdminFunction::dynamicEditHtml($_POST, 'admin_info_block', '/admin/setting/info-block/');
} elseif(isset($_POST['arr']) && count($_POST['arr']) > 0) {
    AdminFunction::dynamicEditQuery($_POST['arr'], 'admin_info_block', '/admin/setting/info-block/', $messG['Редагування пройшло успішно!']);
} elseif(isset($_REQUEST['delete']) || isset($_POST['delete'])) { // Delete
    $ids = (isset($_POST['ids'])? implode(',', $_POST['ids']) : $_REQUEST['delete']);
    if($ids != $messG['Видалити']){
        AdminFunction::deleteEl($ids, 'admin_info_block', '/admin/setting/info-block/', $messG['Видалення пройшло успішно!']);
    }
} elseif(isset($_POST['deactivate']) && isset($_POST['ids'])) { // Deactivate
    AdminFunction::deactivateEl(implode(',', $_POST['ids']), 'admin_info_block', '/admin/setting/info-block/', $messG['Деактивація пройшла успішно!']);
} elseif(isset($_POST['activate']) && isset($_POST['ids'])) { // Activate
    AdminFunction::activeEl(implode(',', $_POST['ids']), 'admin_info_block', '/admin/setting/info-block/', $messG['Активація пройшла успішно!']);
}

// Filter
if(isset($_REQUEST['filterReset'])){
    header('Location: /admin/setting/info-block/');
}

$info_block = AdminFunction::StructureMenu(array(
    'db_table'   => "admin_info_block",
    'url'        => "/admin/setting/info-block/",
    'numPage'    => (!isset($_GET['numPage'])? 1 : (int)$_GET['numPage']),
    'pagination' => array(
        'count_show' => 5,
        'css_class'  => "pagination-admin",
    ),
    'filter'     => (!isset($_GET['filter'])? false : true),
));