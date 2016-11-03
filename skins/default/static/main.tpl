<div class="fix-position main-top">
  <div class="slider-block">
    <h1>ПРОФЕССИОНАЛЬНАЯ ВЕДУЩАЯ И ПЕВИЦА <span>СВЕТЛАНА ЧУМАКО ВА НА ВАШЕМ ПРАЗДНИКЕ</span></h1>

    <?php if($main_banner->num_rows > 0){ ?>
      <div class="main-banner">
        <div class="flex-itemList">
          <?php while($arResult = hsc($main_banner->fetch_assoc())){
            echo '<img src="'.$arResult['img'].'" title="'.$arResult['title'].'" alt="'.$arResult['alt'].'">';
            ++$j;
          } ?>
        </div>
        <div class="flex-rows-list">
          <?php for($i = 0; $i < $j; ++$i){
            echo '<span></span>';
          } ?>
        </div>
        <div class="flex-prev"></div>
        <div class="flex-next"></div>
      </div>
    <?php } ?>
  </div>

  <div class="main-shares">
    <p>ОСТАВЬТЕ ЗАЯВКУ СЕЙЧАС И ПОЛУЧИТЕ СКИДКУ <span>20%</span></p>
    <?=(isset($share['top'])? $share['top'] : '<div class="timer"><p class="timer-text">Таймер не существует</p></div>')?>
  </div>

  <form class="discount-all" action="/?discount-all=ok" method="post" name="discount-all" onsubmit="return checkForm('discount-all');">
    <div class="input-value">
      <input placeholder="Ваше имя*" type="text" name="name" value="<?=(isset($_POST['name'])? $_POST['name'] : '')?>" <?=(isset($check['name'])? $check['name'] : '')?>>
    </div>
    <div class="input-value">
      <input placeholder="Ваш телефон*" type="text" name="phone" value="<?=(isset($_POST['phone'])? $_POST['phone'] : '')?>" <?=(isset($check['phone'])? $check['phone'] : '')?>>
    </div>
    <div class="input-value">
      <input placeholder="Ваш email" type="email" name="email" value="<?=(isset($_POST['email'])? $_POST['email'] : '')?>" <?=(isset($check['email'])? $check['email'] : '')?> data-no-check="Y">
    </div>
    <div class="center-submit">
      <input type="submit" name="ok" value="ОСТАВИТЬ ЗАЯВКУ">
    </div>
  </form>
</div>

<div class="about-us">
  <div class="fix-position">
    <div class="i-about">
      <p>
        <b>ОБО МНЕ</b><br> Профессиональная ведущая и певица. Окончила Институт Современного Искусства по специальности эстрадно-джазовый вокал.
      </p>
      <p class="col-2">Уже 10 лет работаю в сфере организации и проведения праздников:</p>
      <ul>
        <li>&mdash; свадеб;</li>
        <li>&mdash; юбилеев и Дней Рождения;</li>
        <li>&mdash; корпоративных мероприятий.</li>
      </ul>
    </div>

    <div class="i-about-company">
      <p>Я РАБОТАЮ ДЛЯ ТАКИХ КОМПАНИЙ КАК:</p>
      <img src="/skins/default/img/pirog-dvorik-lg-77a6174171.png" alt="photo1" title="photo1">
      <img src="/skins/default/img/Vodovoz.png" alt="photo1" title="photo2">
      <img src="/skins/default/img/part-linder-89c6cfc8c0.png" alt="photo1" title="photo3">
      <img src="/skins/default/img/1russkiy-bcc4bc1ab8.png" alt="photo1" title="photo4">
      <img src="/skins/default/img/part-shantil-5204ff2257.png" alt="photo1" title="photo5">
      <img src="/skins/default/img/part-globez-9c8b9f9cfe.png" alt="photo1" title="photo6">
      <img src="/skins/default/img/ermak-lg-44014cc059.png" alt="photo1" title="photo7">
      <img src="/skins/default/img/drofa.png" alt="photo1" title="photo8">
      <img src="/skins/default/img/part-united-1da573dce6.png" alt="photo1" title="photo9">
      <img src="/skins/default/img/nika-lg-c01394beb9.png" alt="photo1" title="photo10">
      <img src="/skins/default/img/go-life-lg-c8f28452d3.png" alt="photo1" title="photo11">
      <img src="/skins/default/img/part-pnevmo2-4c9c274d86.png" alt="photo1" title="photo12">
    </div>
  </div>
</div>

<div class="fix-position central-block">
  <div class="i-order-lead">
    <p>ПРОБЛЕМЫ, С КОТОРЫМИ СТАЛКИВАЮТСЯ 90% КЛИЕНТОВ ПРИ ЗАКАЗЕ ВЕДУЩЕГО</p>
    <ul class="customer-problems">
      <li>Пустые обещания
        <p>Некоторые ведущие слишком много обещают, но по факту не выполняют и половины.</p>
      </li>
      <li>Неприятные сюрпризы
        <p>Ведущий проводит программу, не обсудив ее заранее с заказчиком (конкурсы, незапланированные тосты и так далее). Это вызвает негативные эмоции и портит настроение клиента и его гостей.</p>
      </li>
      <li>Шаблоны
        <p>Многие «опытные» организаторы проводят ивенты по шаблону, из-за этого событие теряет свою новизну, вырождается и становится неинтересным.</p>
      </li>
    </ul>

    <p>ПОЧЕМУ Я?</p>
    <ul class="why-me">
      <li>Индивидуальный подход
        <p>Каждое событие и мероприятие для меня особенное и я проживаю эти моменты вместе свами.</p>
      </li>
      <li>Долгосрочное сотрудничество
        <p>Большой наградой для меня является благодарность, приятные, добрые слова и поцелуи, цветы и подарки, которые дарят мне сами клиенты, многие из которых стали моими друзьями. Мы общаемся по сей день.</p>
      </li>
      <li>Импровизация
        <p>Мой опыт позволяет выходить из разных сложившихся ситуаций на празднике так, что бы ни кто из гостей не заметил никаких изменений.</p>
      </li>
      <li>Помощь в курировании праздника
        <p>Я не просто провожу мероприятие как ведущая, но и помогаю в курьировании праздника. Вы можете отдыхать и наслаждаться вечером, а мероприятие будет под чутким контролем.</p>
      </li>
      <li>Никаких сюрпризов без ведома заказчика
        <p>Программы и сценарии, тайминги, все это согласовывается и утверждается с заказчиком.</p>
      </li>
      <li>Отзывы моих клиентов говорят сами за себя!</li>
    </ul>
  </div>

  <div class="comments-list">
    <p>ОТЗЫВЫ</p>
    <div class="comment" itemscope itemtype="http://schema.org/UserComments">
      <div class="circle-photo">
        <img src="/skins/default/img/AOVgCq-1Bds.jpg" alt="photo" title="photo">
      </div>
      <p class="header" itemprop="name">&#171;...наша свадьба прошла на веселой и позитивной волне, все гости прибывали в отличном настроении&#187;</p>
      <p class="text" itemprop="commentText">Уважаемая Светлана!!! Благодарим Вас и Александра за восхитительное проведение нашей свадьбы! Благодаря Вашему мастерству, наша свадьба прошла на веселой и позитивной волне, все гости прибывали в отличном настроении, а мы просто наслаждались этим трогательным и счастливейшем днем нашей жизни. Отдельное спасибо, что учли все наши пожелания, даже небольшие нюансы не пропустили. Желаем от нашей семьи, которая началась так весело и счастливо, всех благ Вам, успехов, благополучия и здоровья!</p>
      <p class="author" itemprop="creator">Артур и Амалия</p>
    </div>

    <div class="comment" itemscope itemtype="http://schema.org/UserComments">
      <div class="circle-photo">
        <img src="/skins/default/img/go-life-lg-c8f28452d3.jpg" alt="photo" title="photo">
      </div>
      <p class="header" itemprop="name">&#171;...получили огромное удовольствие и массу позитивных эмоций&#187;</p>
      <p class="text" itemprop="commentText">Нам хотелось бы поблагодарить ведущую и певицу Светлану Чумакову за профессионализм, креативность, отзывчивость и стремление сделать из любого мероприятия что-то особенное. Сотрудники нашей компании получили огромное удовольствие и массу позитивных эмоций от организованного Вами вечера.</p>
      <p class="author" itemprop="creator">Ген. директор ООО &#187;Гоу-Лайф&#187; Полетаев В. А.</p>
    </div>
  </div>
</div>

<div class="steps-working-list">
  <div class="fix-position">
    <p>КАК Я РАБОТАЮ</p>
    <div class="item">
      <div class="circle-photo min-photo">
        <img src="/skins/default/img/A_woman_on_computer.jpg" alt="photo" title="photo">
      </div>
      <p>Звоните или оставляете заявку на сайте</p>
    </div>
    <div class="separator"></div>
    <div class="item">
      <div class="circle-photo">
        <img src="/skins/default/img/DPP_23.JPG" alt="photo" title="photo">
      </div>
      <p>Перезваниваю вам в течение нескольких часов</p>
    </div>
    <div class="separator"></div>
    <div class="item">
      <div class="circle-photo">
        <img src="/skins/default/img/MPj042303000001.jpeg" alt="photo" title="photo">
      </div>
      <p>Встречаемся лично, что исключает многие неприятные ситуации</p>
    </div>
    <div class="separator"></div>
    <div class="item">
      <div class="circle-photo min-photo">
        <img src="/skins/default/img/IMG_2608.JPG" alt="photo" title="photo">
      </div>
      <p>Определяем сценарий по вашему личному заказу</p>
    </div>
    <div class="separator"></div>
    <div class="item">
      <div class="circle-photo">
        <img src="/skins/default/img/DPP_0520.JPG" alt="photo" title="photo">
      </div>
      <p>Готовим праздник</p>
    </div>
    <div class="separator"></div>
    <div class="item">
      <div class="circle-photo min-photo">
        <img src="/skins/default/img/DPP_1522.JPG" alt="photo" title="photo">
      </div>
      <p>Проведение мероприятия и ваши позитивные змоции</p>
    </div>
    <div class="separator"></div>
  </div>
</div>

<div class="duet-block">
  <div class="fix-position">
    <p>Ведение праздника может быть в дуэте. А так же всегда рада рекомендовать вам своих друзей — лучших ведущих Москвы.</p>
    <div class="duet-photo">
      <div class="circle-photo min-photo">
        <img src="/skins/default/img/phoca_thumb_l_111.jpg" alt="photo" title="photo">
      </div>
      <div class="circle-photo min-photo">
        <img src="/skins/default/img/phoca_thumb_l_troynov-small.jpg" alt="photo" title="photo">
      </div>
      <div class="circle-photo min-photo">
        <img src="/skins/default/img/phoca_thumb_l_x_4e17f845.jpg" alt="photo" title="photo">
      </div>
      <div class="circle-photo min-photo">
        <img src="/skins/default/img/phoca_thumb_l_x_55e27ddc.jpg" alt="photo" title="photo">
      </div>
    </div>
  </div>
</div>

<div class="fix-position report">
  <div class="content-file">
    <p>ОТЧЕТЫ С ПРОВЕДЕННЫХ МНОЙ МЕРОПРИЯТИЙ</p>
    <div class="video">
      <iframe src="https://www.youtube.com/embed/jKbmd1QJWI4" frameborder="0" allowfullscreen></iframe>

      <video id="cool-video1" class="video-js">
        <source type="video/flash" src="/uploaded/videos/test.flv">
        <source type="video/mp4" src="/uploaded/videos/test.mp4">
        <source type="video/webm" src="/uploaded/videos/test.webm">
        <source type="video/ogg" src="/uploaded/videos/test.ogv">
      </video>
    </div>
    <div class="album-photos">
      <a href="/skins/default/img/DPP_767.JPG"><img src="/skins/default/img/DPP_767.JPG" alt="photo1" title="photo1"></a>
      <a href="/skins/default/img/x_4410006c.jpg"><img src="/skins/default/img/x_4410006c.jpg" alt="photo2" title="photo2"></a>
      <a href="/skins/default/img/x_4410006c.jpg"><img src="/skins/default/img/x_4410006c.jpg" alt="photo3" title="photo3"></a>
      <a href="/skins/default/img/DPP_86.JPG"><img src="/skins/default/img/DPP_86.JPG" alt="photo4" title="photo4"></a>
      <a href="/skins/default/img/DPP_496.JPG"><img src="/skins/default/img/DPP_496.JPG" alt="photo5" title="photo5"></a>
      <a href="/skins/default/img/DPP_790.JPG"><img src="/skins/default/img/DPP_790.JPG" alt="photo6" title="photo6"></a>
      <a href="/skins/default/img/DPP_008.JPG"><img src="/skins/default/img/DPP_008.JPG" alt="photo7" title="photo7"></a>
      <a href="/skins/default/img/IMG_3809.jpg"> <img src="/skins/default/img/IMG_3809.jpg" alt="photo8" title="photo8"></a>
      <a href="/skins/default/img/x_4410006c.jpg"><img src="/skins/default/img/x_4410006c.jpg" alt="photo9" title="photo9"></a>
    </div>
  </div>

  <div class="music-shares">
    <p>ОТПРАВЬТЕ ЗАЯВКУ СЕЙЧАС И ПОЛУЧИТЕ СКИДКУ <span>20%</span> НА ЗАКАЗ МУЗЫКАНТОВ</p>
    <?=(isset($share['bottom'])? $share['bottom'] : '<div class="timer"><p class="timer-text">Таймер не существует</p></div>')?>
  </div>

  <form class="discount-music" action="/?discount-music=ok" method="post" name="discount-music" onsubmit="return checkForm('discount-music');">
    <div class="input-value">
      <input placeholder="Ваше имя*" type="text" name="name" value="<?=(isset($_POST['name'])? $_POST['name'] : '')?>" <?=(isset($check['name'])? $check['name'] : '')?>>
    </div>
    <div class="input-value">
      <input placeholder="Ваш телефон*" type="text" name="phone" value="<?=(isset($_POST['phone'])? $_POST['phone'] : '')?>" <?=(isset($check['phone'])? $check['phone'] : '')?>>
    </div>
    <div class="center-submit">
      <input type="submit" name="ok" value="ОСТАВИТЬ ЗАЯВКУ">
    </div>
  </form>
</div>