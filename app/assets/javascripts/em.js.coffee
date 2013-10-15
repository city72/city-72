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

    startJoyride = ->
        $("#joyride-steps").joyride()
        #strange bug, if called once, it doesn't work
        $("#joyride-steps").joyride()

    showIntroVideo = ->

    showIntro = ->
        if !window.Sf72.Utils.isMobile()
            startJoyride()
            $('.em-preview-modal').show()
            $('.tour-intro-step2').show()
        else
            $('.modal-wrapper').hide()

    initializeShowMapTipsBtn = ->
        $('.map-tips-trigger').click ->
            startJoyride()

    initializeShowMapTipsBtn()

    $('a.icon-close').click -> 
        $('.modal-wrapper').hide(0, ->
                $('.em-preview-modal').remove()
            )
    $('a.btn').click -> $('.modal-wrapper').hide()


    map = 
        elements: [".map-container", ".map-area", ".map"]
        triggerElement: '.expand-map-trigger'
        
        isCollapsed: true

        _changeMapHeight: (action) ->
            $.each this.elements, (index, elem) -> $(elem).animate { height: action($(elem).height()) }

        collapse: -> 
            this._changeMapHeight (currentHeight) -> currentHeight - 300
            $(this.triggerElement).html("Expand Map")
            this.isCollapsed = true
        expand: -> 
            this._changeMapHeight (currentHeight) -> currentHeight + 300
            $(this.triggerElement).html("Collapse Map")
            this.isCollapsed = false

        switchState: ->
            if this.isCollapsed
                this.expand()
            else
                this.collapse()

    $('.expand-map-trigger').click -> map.switchState()
)
