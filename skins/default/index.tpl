<!DOCTYPE html>
<html lang="<?=(($lang == Core::$SITE_LANG[0])? (Core::$SITE_LANG[0] == 'ua'? 'ru' : Core::$SITE_LANG[0]) : $lang)?>" <?=(isset($contentOG)? 'prefix="og: http://ogp.me/ns#"' : "")?>>
<head>
  <meta charset="UTF-8">
  <title><?=Core::$META['title']?></title>
  <meta name="apple-mobile-web-app-title" content="<?=Core::$META['title']?>">
  <meta name="description" content="<?=Core::$META['description']?>">
  <meta name="keywords" content="<?=Core::$META['keywords']?>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="Савіцький Андрій">
  <meta name="robots" content="index, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="address=no">

  <?php foreach(Core::$META['dns-prefetch'] as $v){ ?>
    <link rel="dns-prefetch" href="<?=$v?>">
  <?php } ?>
  <link rel="canonical" href="<?=Core::$META['canonical']?>">

  <?=(isset($contentOG)? $contentOG : "")?>

  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" href="/touch-icon-iphone.png">
  <link rel="apple-touch-icon" sizes="76x76" href="/touch-icon-ipad.png">
  <link rel="apple-touch-icon" sizes="120x120" href="/touch-icon-iphone-retina.png">
  <link rel="apple-touch-icon" sizes="152x152" href="/touch-icon-ipad-retina.png">

  <style><?=$style?></style>
  <!--[if lt IE 9]>
  <script src="/skins/default/js/ielt9.min.js" defer></script><![endif]-->
  <script src="/vendor/public/jquery/dist/jquery.min.js" defer></script>
  <?=(count(Core::$JS)? implode("\n", Core::$JS) : '')?>
  <script src="/skins/default/js/script.min.js?v=<?=$vF?>" defer></script>

  <script type="application/ld+json">
    {
      "@context": "http://schema.org",
      "@type": "Organization",
      "url" : "<?=$arMainParam['url_http_site'].$link_lang?>",
      "logo" : "<?=$arMainParam['url_http_site']?>/skins/default/img/logo.png",
      "name": "Ведущие на свадьбу, юбилей, корпоратив в Москве и МО",
      "telephone": "+7 (495) 760-96-50",
      "email": "test@test.test",
      "address": {
        "name": "Vatel корпоративы",
        "@type": "PostalAddress",
        "addressLocality": "Sity, Country"
      }
    }

  </script>
</head>

<body itemscope itemtype="http://schema.org/WebPage">
<noscript>
  <div class="no-script">
    <b>JavaScript disabled</b>
    <hr>
    <p>
      <i>JavaScript is disabled</i> on your browser. To use The Analytical Scientist please enable JavaScript or upgrade to a JavaScript capable browser.
    </p>
  </div>
</noscript>

<meta itemprop="description" content="<?=Core::$META['description']?>">

<header itemscope itemtype="http://schema.org/WPHeader">
  <div class="fix-position">
    <a href="/" class="logo"><img src="/skins/default/img/logo.png" alt="Logo"></a>
    <p>Ведущие на свадьбу, юбилей,<br> корпоратив в Москве и МО</p>
    <div class="clear"></div>
    <div class="make-up" data-name-modal="make-up"><p>Закажите звонок</p></div>
    <div class="phone">
      <a href="<?=(isMobile()? 'tel:' : 'callto:').calltoPhone('74957609650')?>" title="text">+7 (495) 760-96-50</a>
      <a href="<?=(isMobile()? 'tel:' : 'callto:').calltoPhone('79265868003')?>" title="text">+7 (926) 586-80-03</a>
    </div>
  </div>
</header>

<main><?=$content?></main>

<footer itemscope itemtype="http://schema.org/WPFooter">
  <div class="fix-position">
    <p>Остались вопросы? Позвоните нам
      <a href="<?=(isMobile()? 'tel:' : 'callto:').calltoPhone('74957609650')?>" title="text">+7 (495) 760-96-50,</a>
      <a href="<?=(isMobile()? 'tel:' : 'callto:').calltoPhone('79265868003')?>" title="text">+7 (926) 586-80-03</a><br> Или закажите
      <span data-name-modal="make-up">обратный звонок</span>
    </p>
    <p>&copy; Праздничное агентство &laquo;Vatel&raquo; &mdash; музыкальный колектив на праздник в Москве и МО</p>
  </div>
</footer>

<link rel="stylesheet" property="stylesheet" href="/vendor/public/video.js/dist/video-js.min.css">

<div id="scroll-top"><span>›</span></div>

<div data-modal="make-up">
  <p class="modHeader">Отправьте заявку и мы обязательно Вам перезвоним</p>
  <form action="/?callback=ok" method="post" name="callback" onsubmit="return checkForm('callback');">
    <div class="input-value">
      <p>Ваше имя*</p>
      <input type="text" name="name" value="">
    </div>
    <div class="input-value">
      <p>Ваш телефон*</p>
      <input type="text" name="phone" value="">
    </div>
    <div class="center-submit">
      <input type="submit" name="ok" value="ОСТАВИТЬ ЗАЯВКУ">
    </div>
  </form>
</div>

<div data-modal="successful-callback">
  <p class="modHeader">Спасибо за заявку!</p>
  <p>Наш менеджер перезвонит Вам в ближайшее время.</p>
</div>

<div data-modal="successful-discount-all">
  <p class="modHeader">Спасибо за заявку!</p>
  <p>Спасибо, что выбрали имено нас! Вам надано скидку в 20%. Наш менеджер свяжетса с вами в ближайшое время.</p>
</div>

<div data-modal="successful-discount-music">
  <p class="modHeader">Спасибо за заявку!</p>
  <p>Спасибо, что выбрали имено нас! Вам надано скидку в 20% на заказ музикантів. Наш менеджер свяжетса с вами в ближайшое время.</p>
</div>

</body>
</html>