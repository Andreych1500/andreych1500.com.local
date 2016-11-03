$(document).ready(function () {
    if (!navigator.cookieEnabled) {
        alert('You have disabled cookies. Several functions may not work intermittently or completely broken. Enable cookies for perhaps convenient robots s website');
    }

    // Open Modal Window
    $('[data-name-modal]').unbind('click').click(function () {
        var name = $(this).attr('data-name-modal');

        modalWindow(name);
    });

    // Start Slider
    $('.main-banner').flexslider({
        animation: 'fade',
        selector: ".flex-itemList > img",
        touch: false, // IE знімаємо фікс у анімації fade(розроники на touch css подію вписали webkitTransition для IE це не підтримується)
        controlNav: true,
        manualControls: ".flex-rows-list span",
        directionNav: true,
        customDirectionNav: ".flex-prev, .flex-next"
    });

    // Start Timer
    var objTimers = {};

    $('.timer[data-timer-id]').each(function (i) {
        objTimers[i] = {
            id: $(this).attr('data-timer-id'),
            start: $(this).attr('data-timer-start'),
            end: $(this).attr('data-timer-end'),
            text: $(this).attr('data-timer-text')
        };
    });

    getTimer(objTimers);

    // To Top
    scroll_top();

    // Video js
    videojs('cool-video1', {
        controls: true,
        autoplay: false,
        preload: "none",
        poster: "/skins/default/img/video-dp.png",
        controlBar: {
            volumeMenuButton: {
                inline: false,
                vertical: true
            },
            liveDisplay: true,
            muteToggle: false
        }
    }, function () {
        //this.play();

        // Кожну подію можна відслідкувати і визвати свій код
        //this.on('play', function(e) {});
    });

    // Magnific popup
    $('.album-photos').magnificPopup({
        delegate: 'a',
        type: 'image',
        gallery: {
            enabled: true
        },
        mainClass: 'mfp-with-zoom',
        zoom: {
            enabled: true,
            duration: 300,
            easing: 'ease-in-out',
            opener: function (openerElement) {
                return openerElement.is('img') ? openerElement : openerElement.find('img');
            }
        }

    });
});

function getTimer(obj) {
    var date = new Date();
    var date_t; // Кінцева дата
    var timer; // Скільки залишається до кінця таймінга
    var sel;
    var param;
    var text;
    var newDate = false;

    for (var prop in obj) {
        if (!obj.hasOwnProperty(prop)) {
            continue;
        }

        param = obj[prop];
        sel = $('.timer[data-timer-id="' + param.id + '"]');

        if (param.end === undefined) {
            delete(obj[prop]);
            continue;
        } else if (param.start.length > 0) {
            date_t = new Date(param.start);

            if (date_t < date) {
                date_t = new Date(param.end);
                sel.find('.timer-text').text(param.text.split('|')[0]);
                obj[prop].start = '';
                newDate = true;
            }
        } else {
            date_t = new Date(param.end);
        }

        if (date_t > date) { // Провіряєм на закінчення відліку
            timer = date_t - date;

            var day = parseInt(timer / (24 * 60 * 60 * 1000));
            day = (day < 10 ? '00' + day : (day > 99 ? day : '0' + day)).toString();

            var hour = parseInt(timer / (60 * 60 * 1000)) % 24;
            hour = (hour < 10 ? '0' + hour : hour).toString();

            var min = parseInt(timer / (1000 * 60)) % 60;
            min = (min < 10 ? '0' + min : min).toString();

            var sec = parseInt(timer / 1000) % 60;
            sec = (sec < 10 ? '0' + sec : sec).toString();

            if (newDate) {
                sel.find('.day').html('<span>' + day[0] + '</span> <span>' + day[1] + '</span> <span>' + day[2] + '</span>');
                sel.find('.hour').html('<span>' + hour[0] + '</span> <span>' + hour[1] + '</span>');
                sel.find('.min').html('<span>' + min[0] + '</span> <span>' + min[1] + '</span>');
                sel.find('.sec').html('<span>' + sec[0] + '</span> <span>' + sec[1] + '</span>');
                continue;
            }

            // Replace Animation
            var nextDay = false;

            // Дні
            if (hour == 23 && min == 59 && sec == 59) {
                nextDay = true;
            }

            if (day[1] == 9 && day[2] == 9 && nextDay) {
                animation_t(sel.find('.day span:first'), day[0]);
            }

            if (day[1] == 9 && nextDay) {
                animation_t(sel.find('.day span:eq(1)'), day[1]);
            }

            if (nextDay) {
                animation_t(sel.find('.day span:last'), day[2])
            }

            // Години
            if ((hour == 9 || hour == 19 || hour == 23) && min == 59 && sec == 59) {
                animation_t(sel.find('.hour span:first'), hour[0]);
            }

            if (min == 59 && sec == 59) {
                animation_t(sel.find('.hour span:last'), hour[1]);
            }

            // Хвилини
            if (min[1] == 9 && sec == 59) {
                animation_t(sel.find('.min span:first'), min[0]);
            }

            if (sec == 59) {
                animation_t(sel.find('.min span:last'), min[1]);
            }

            // Секунди
            if (sec[1] == 9) {
                animation_t(sel.find('.sec span:first'), sec[0]);
            }

            animation_t(sel.find('.sec span:last'), sec[1]);
        } else {
            sel.html('<p class="timer-text">' + param.text.split('|')[1] + '</p>');
            delete(obj[prop]);
        }
    }

    var count = 0;
    for (var i in obj) {
        if (obj.hasOwnProperty(i)) {
            count++;
        }
    }

    if (count > 0) {
        setTimeout(function () {
            getTimer(obj)
        }, 1000);
    } else {
        return false;
    }
}

function animation_t(sel, param) {
    sel.html(param).css({'top': '-45px', 'opacity': '0'}).animate({'top': '0', 'opacity': '1'}, 600);
}

function modalWindow(dataName) {
    var nameBlock = dataName;
    var content = $('div[data-modal="' + nameBlock + '"]');

    if (content.length) {
        // Wrap Content
        $(function () {
            var modal = '<div class="dm-overlay"><div class="dm-table"><div class="dm-cell"><div class="dm-modal"></div></div></div></div>';

            content.wrap(modal).before('<div class="close">X</div>');
        });

        $('body').click(function (e) {
            var el = e.target;

            if ($(el).parents().is('.dm-overlay') && ($(el).is('.close') || $(el).is('.dm-cell'))) {
                var backContent = $('div[data-modal="' + nameBlock + '"]');

                $('.dm-table').hide();
                $('.dm-overlay').animate({opacity: 0}, function () {
                    $(this).remove();
                });

                $('footer').after(backContent);
            }
        });
    } else {
        alert('Error: modal window with that name does not exist');
    }
}

function checkForm(nameForm) {
    var obj = $('form[name=' + nameForm + '] input:not([type="submit"])');
    var action = $('form[name=' + nameForm + ']').attr('action');
    var error = 0;
    var value = {};

    for (var i = 0; i < obj.length; i++) {
        var input = $(obj[i]);
        value[input.attr('name')] = input.val();

        if (input.attr('data-no-check') !== undefined) { // Поле яке не перевіряємо
            continue;
        }

        // Check email
        if (input.attr('name') == 'email') {
            var atpos = input.val().indexOf("@");
            var dotpos = input.val().lastIndexOf(".");

            if (!(atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= input.val().length) == false) {
                input.addClass('error');
                error = 1;
            }
        }

        if (input.val().length === 0) {
            input.addClass('error');
            error = 1;
        }
    }

    if (error == 0) {
        $.ajax({
            type: "POST",
            url: action + '&ajax=ok',
            cache: false,
            data: value,
            success: function (response) {
                var res = JSON.parse(response);

                if (res['error'] === undefined && res['successful'] == 'ok') {
                    // Тут розділяємо форми

                    if (nameForm == 'discount-all') {
                        setTimeout(function () {
                            modalWindow('successful-' + nameForm);
                            $('form[name="' + nameForm + '"]')[0].reset();
                        }, 500);
                    } else if (nameForm == 'callback') {
                        $('form[name="' + nameForm + '"]')[0].reset();
                        $('.close').trigger('click');

                        setTimeout(function () {
                            modalWindow('successful-' + nameForm);
                        }, 500);
                    } else if (nameForm == 'discount-music') {
                        setTimeout(function () {
                            modalWindow('successful-' + nameForm);
                            $('form[name="' + nameForm + '"]')[0].reset();
                        }, 500);
                    } else {
                        alert('The form with this "' + nameForm + '" was not found');
                    }
                } else {
                    alert(res['error']);
                }
            }
        });

        return false;
    } else {
        for (var j = 0; j < obj.length; j++) {
            if ($(obj[j]).is('.error')) {
                (function (i) {
                    $(obj[i]).delay(3500).queue(function (next) {
                        $(this).removeAttr('class');
                        next();
                    });
                })(j); // (j) - ключ в пам'яті браузера про анонімну створену функцію
            }
        }

        return false;
    }
}

function scroll_top() {
    $('#scroll-top').on('click', function () {
        $('html, body').animate({scrollTop: 0});
        return false;
    });

    $(window).scroll(function () {
        if ($(window).scrollTop() > 400) {
            $('#scroll-top').fadeIn();
        } else {
            $('#scroll-top').fadeOut();
        }
    });

    $(window).scroll();
}