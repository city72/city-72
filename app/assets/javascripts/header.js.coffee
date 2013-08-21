class Header 

    initilized = false

    # Initializes the header
    init: ->
        if !initilized
            _initializeMobileMenu()
            _initializeMobileActiveBtn()
            _initializeActiveButton()
            _defineMode()
            initilized = true

    # Initializes jquery.mobile-menu.js
    _initializeMobileMenu = ->
        $("body").mobile_menu({
            menu: '.mobile-menu',
            menu_width: 270,
            prepend_button_to: '.header'
        });

    # Sets the active button based on the URL
    _initializeActiveButton = ->
            windowPath = window.location.pathname
            hash = window.location.hash
            paths = _($('.header a')).pluck 'pathname'

            if windowPath == '/home' || windowPath == '/'
                $('[href="/home"]').addClass('active')
                window.Sf72.Utils.setAsActiveBtn $('[href="/home"]')
            else
                _(paths).each (path) ->
                    if path == windowPath
                        window.Sf72.Utils.setAsActiveBtn $('[href="' + path + '"]')
                        window.Sf72.Utils.setAsActiveBtn $('[href="' + path + hash + '"]')
                        $('[href="' + path + '"]').closest('ul.submenu') if $('[href="' + path + '"]').closest('.submenu')

    # Adds click callback for setting the active button when the request
    # is resolved in the client side
    _initializeMobileActiveBtn = ->
        js_buttons_li = $('.js-button-li')
        js_buttons_li.children('a').click ->
            $('#build-menu-overlay').trigger('click')
            js_buttons_li.each (i,e) ->
                $(e).removeClass('active')
            window.Sf72.Utils.setAsActiveBtn $(this)

    # Shows the proper content based on the current mode
    _defineMode = ->
        $.get window.location.origin + "/em", (response) ->
            if response.em_mode
                $('.mobile-menu .normal-mode').hide()
                $('.mobile-menu .crisis-mode').show()

@Sf72.Header = new Header(@Sf72)
