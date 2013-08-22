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

    # $.get(window.location.origin + "/em",
    #     (response) ->
    #         if response.em_mode
    #             $('.alert-info h3').text(response.title)
    #             $('.alert-info p').text(response.text)
    # )

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

    isMobile = -> $(window).width() < 480 or $(window).height() < 480

    startJoyride = ->
        $("#joyride-steps").joyride()
        #strange bug, if called once, it doesn't work
        $("#joyride-steps").joyride()

    showIntroVideo = ->

    showIntro = ->
        if !isMobile()
            
            startJoyride()

            $('.em-preview-modal').show()
            iframe = $("#video-opening")[0]
            player = $f(iframe)
            player.addEvent "ready", ->
                player.addEvent "finish", (id) ->
                    $('.tour-intro').hide()
                    $('.tour-intro-step2').show()
        else
            $('.modal-wrapper').hide()

    showIntro()

    initializeShowMapTipsBtn = ->
        $('.map-tips-trigger').click ->
            startJoyride()

    initializeShowMapTipsBtn()

    $('a.icon-close').click -> $('.modal-wrapper').hide()
    $('a.btn').click -> $('.modal-wrapper').hide()
)