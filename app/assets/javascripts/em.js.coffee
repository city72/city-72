$( ->
    reports = [
        { href: '#tab-citizen-updates', contentSelector: '.citizen-reports', anchorSelector: '[href="#tab-citizen-updates"]' }
        { href: '#tab-official-reports', contentSelector: '.official-reports', anchorSelector: '[href="#tab-official-reports"]' }
        { href: '#tab-service-status', contentSelector: '.status', anchorSelector: '[href="#tab-service-status"]' }
    ]

    $('a.show-quick-guide').click ->
        $('.em-quick-guide').addClass 'active'
        $('a.hide-quick-guide').css('display', 'block')
        $(this).css('display', 'none')

    $('a.hide-quick-guide').click ->
        $('.em-quick-guide').removeClass 'active'
        $('a.show-quick-guide').css('display', 'block')
        $(this).css('display', 'none')

    $.get(window.location.origin + "/em",
        (response) ->
            $('.alert-info h3').text(response.title)
            $('.alert-info p').text(response.text)
    )

    mobileSections = [
        { href: '#mobile-maps' },
        { href: '#mobile-quick-guide' },
        { href: '#mobile-updates' },
    ]

    showMobileTab = (sections) ->
        urlHash = window.location.hash || sections[0].href
        $(urlHash).addClass 'active'
        _(_(sections).filter((elem) -> elem.href != urlHash)).each (section) -> $(section.href).removeClass 'active'

        is_report = _(_(reports).filter((elem) -> elem.href == urlHash))._wrapped.length > 0
        if is_report
            $('#mobile-updates').addClass 'active'

    showActive reports
    showMobileTab mobileSections

    window.onhashchange = ->
        showActive reports
        showMobileTab mobileSections

    $('.em-preview-modal').hide()
    $.get window.location.origin + "/em", (response) ->
        if !response.em_mode
            if $(window).width() > 480 and $(window).height() > 480
                $("#joyride-steps").joyride()
                #strange bug, if called once, it doesn't work
                $("#joyride-steps").joyride()
                $('.em-preview-modal').show()
                onFinish = (id) ->
                   $('.tour-intro').hide()
                   $('.tour-intro-step2').show()
                iframe = $("#video-opening")[0]
                player = $f(iframe)
                player.addEvent "ready", ->
                    player.addEvent "finish", onFinish
            else
                $('.modal-wrapper').hide()

    $('a.icon-close').click -> $('.modal-wrapper').hide()
    $('a.btn').click -> $('.modal-wrapper').hide()
)