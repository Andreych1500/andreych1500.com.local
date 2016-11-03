<?php
if(isset($_GET['ajax'], $_GET['callback'])){
    if(isset($_POST['name'], $_POST['phone']) && !emptyArray($_POST)){
        $_POST = mres($_POST);

        echo json_encode(array('successful' => 'ok'));
        exit;
    } else {
        echo json_encode(array('error' => 'Error: insufficient number of parameters in the array!'));
        exit;
    }
}

if(isset($_GET['discount-music'])){
    if(isset($_POST['name'], $_POST['phone'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['phone'] = (empty($_POST['phone'])? 'class="error"' : '');

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            if($_GET['ajax']){
                echo json_encode(array('successful' => 'ok'));
                exit;
            } else {
                header('Location: /');
                exit();
            }
        } else {
            if($_GET['ajax']){
                echo json_encode(array('error' => 'Error: insufficient number of parameters in the array!'));
                exit;
            } else {
                // Тут кажемо шо у вас помилки
                header('Location: /');
                exit();
            }
        }
    } else {
        if($_GET['ajax']){
            echo json_encode(array('error' => 'Error: insufficient number of parameters in the array!'));
            exit;
        } else {
            // Тут кажемо шо у вас помилки
            header('Location: /');
            exit();
        }
    }
}

if(isset($_GET['discount-all'])){
    if(isset($_POST['name'], $_POST['phone'], $_POST['email'])){
        $error = array();
        $_POST = trimAll($_POST);

        $check['name'] = (empty($_POST['name'])? 'class="error"' : '');
        $check['phone'] = (empty($_POST['phone'])? 'class="error"' : '');

        if(!empty($_POST['email'])){
            $check['email'] = (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)? 'class="error"' : '');
        }

        if(in_array('class="error"', $check)){
            $error['stop'] = 1;
        }

        if(!count($error)){
            $_POST = mres($_POST);

            if(!empty($_POST['email'])){
                Mail::$text = TemplateMail::HtmlMail('', 'discount-all', $arMainParam);

                if(Mail::$text){
                    Mail::$to = $_POST['email'];
                    Mail::send();
                }
            }

            if($_GET['ajax']){
                echo json_encode(array('successful' => 'ok'));
                exit;
            } else {
                header('Location: /');
                exit();
            }
        } else {
            if($_GET['ajax']){
                echo json_encode(array('error' => 'Error: insufficient number of parameters in the array!'));
                exit;
            } else {
                // Тут кажемо шо у вас помилки
                header('Location: /');
                exit();
            }
        }
    } else {
        if($_GET['ajax']){
            echo json_encode(array('error' => 'Error: insufficient number of parameters in the array!'));
            exit;
        } else {
            // Тут кажемо шо у вас помилки
            header('Location: /');
            exit();
        }
    }
}

$j = 0;
$main_banner = q("
    SELECT * 
    FROM `admin_main_banner`
    WHERE `active` = 1
    ORDER BY `sort` DESC
");

$shares = q("
    SELECT `id`, `name`, `end`, `start`, `symbol_code`
    FROM admin_shares
    WHERE `active` = 1
    AND `end` != ''
");

if($shares->num_rows > 0){
    while($row = hsc($shares->fetch_assoc())){
        $stop = false;
        $jsEnd = (new DateTime($row['end']))->format('M d,Y H:i:s');
        $jsStart = '';

        if(!empty($row['start'])){
            $jsStart = (new DateTime($row['start']))->format('M d,Y H:i:s');
            $d = timePassed($row['start'], 'to');
        }

        if(!isset($d) || !is_array($d)){
            if(!is_array($d = timePassed($row['end'], 'end'))){
                $stop = true;
            }
        }

        if($stop){
            $htmlTimer = '<div class="timer" data-timer-id="'.$row['id'].'"><p class="timer-text">Акция Завершена</p></div>';
        } else {
            $d['type'] = ($d['type'] == 'end'? 'До конца акции:' : 'До начала акции:');

            $htmlTimer = '<div class="timer" data-timer-id="'.$row['id'].'" data-timer-start="'.$jsStart.'" data-timer-end="'.$jsEnd.'" data-timer-text="До конца акции:|Акция Завершена">
              <p class="timer-text">'.$d['type'].'</p>
              
              <div class="day">
                <span>'.$d['day'][0].'</span> <span>'.$d['day'][1].'</span> <span>'.$d['day'][2].'</span>
              </div>
              
              <div class="separator">:</div>
                    
              <div class="hour">
                <span>'.$d['hour'][0].'</span> <span>'.$d['hour'][1].'</span>
              </div>
              
              <div class="separator">:</div>

              <div class="min">
                <span>'.$d['min'][0].'</span> <span>'.$d['min'][1].'</span>
              </div>
              
              <div class="separator">:</div>

              <div class="sec">
                <span>'.$d['sec'][0].'</span> <span>'.$d['sec'][1].'</span>
              </div>
            </div>';
        }

        $share[$row['symbol_code']] = $htmlTimer;
    }
}

Core::$JS[] = '<script src="/vendor/public/flexslider/jquery.flexslider.min.js" defer></script>';
Core::$JS[] = '<script src="/vendor/public/video.js/dist/video.min.js" defer></script>';
Core::$JS[] = '<script src="/vendor/public/magnific-popup/dist/jquery.magnific-popup.min.js" defer></script>';