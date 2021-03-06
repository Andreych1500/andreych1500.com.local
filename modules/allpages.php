<?php
if(Core::$CONT != 'modules/admin'){

    // Seo meta tags
    foreach(explode(',', $GM['list_length']) as $k => $v){
        if($lang == 'ua'){
            Core::$META['title'] = hsc(explode('#|#', $GM['meta_title'])[$k]);
            Core::$META['keywords'] = hsc(explode('#|#', $GM['meta_keywords'])[$k]);
            Core::$META['description'] = hsc(explode('#|#', $GM['meta_description'])[$k]);
        }
    }

    // Dns loading asynchronous
    Core::$META['dns-prefetch'] = array(
        0 => $arMainParam['url_http_site'],
    );

    // Canonical
    Core::$META['canonical'] = $arMainParam['url_http_site'].$link_lang.(($GM['module'] == 'static')? '' : $GM['module'].'/');

    // Alternate lang
    $module_url = (($GM['module'] == 'static')? '' : $GM['module'].'/');
    Core::$META['alternate'] = $arMainParam['url_http_site'].$link_lang.$module_url;
    foreach(Core::$SITE_LANG as $k => $v){
        Core::$META['alternate_'.$v] = $arMainParam['url_http_site'].(($v == Core::$SITE_LANG[0])? '/' : '/'.$v.'/').$module_url;
    }

    // RDFa open graph
    if($GM['open_graph_page']){
        $contentOG = '';

        $contentOG .= '<meta property="og:title" content="'.Core::$META['title'].'">
                <meta property="og:description"  content="'.Core::$META['description'].'">';

        if(!empty($GM['og_type'])){
            $contentOG .= '<meta property="og:type" content="'.hsc($GM['og_type']).'">';
        }
        if(!empty($GM['og_url'])){
            $contentOG .= '<meta property="og:url" content="'.$arMainParam['url_http_site'].(($lang == Core::$SITE_LANG[0])? '' : '/'.$lang).$GM['og_url'].'">';
        }
        if(!empty($GM['og_image'])){
            $contentOG .= '<meta property="og:image" content="'.$arMainParam['url_http_site'].$GM['og_image'].'">';
        }
    }
} else {

    // Access
    if(isset($_SESSION['user'])){
        $arAccess = q("
            SELECT *
            FROM `admin_users_list`
            WHERE `id` = ".(int)$_SESSION['user']['id']."
            AND `active` != 0
            AND `access` = 5
            LIMIT 1
	      ");

        if($arAccess->num_rows){
            $_SESSION['user'] = $arAccess->fetch_assoc();
            $globalAccess = true;
        } else {
            menuExit();
        }
    } else {
        $globalAccess = false;

        if($_GET['module'] != 'static'){
            header("Location: /admin/");
            exit();
        }
    }

    if(isset($_COOKIE['authhash'], $_COOKIE['id'])){
        $auth = q("
            SELECT *
			      FROM `admin_users_list`
			      WHERE `hash` = '".mres($_COOKIE['authhash'])."'
            AND `id`   = ".(int)$_COOKIE['id']."
            AND `active` != 0
			      AND `access` = 5
			      LIMIT 1
	      ");

        if($auth->num_rows){
            $_SESSION['user'] = $auth->fetch_assoc();
            $globalAccess = true;
        } else {
            menuExit();
        }
    }

    // Exit
    if(isset($_REQUEST['exit'])){
        menuExit();
    }

    // Menu
    if(isset($_COOKIE['act-menu-lv2'])){
        $arrayActMenu = (array)json_decode($_COOKIE['act-menu-lv2']);
    }

    // Admin menu
    include './modules/admin/admin_menu.php';
}