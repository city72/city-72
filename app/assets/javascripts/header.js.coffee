jQuery ( ->

    Header = 
        setAsActiveBtn: (elem) ->
            $(elem).parent('li').addClass('active')

        # Initilzes jquery.mobile-menu.js
        _initializeMobileMenu: ->
            $("body").mobile_menu({
                menu: '.mobile-menu',
                menu_width: 270,
                prepend_button_to: '.header'
            });
        
        # Sets the active button based on the current pathname and hash 
        _initializeActiveButton: ->
            windowPath = window.location.pathname
            hash = window.location.hash
            paths = _($('.header a')).pluck 'pathname'

            if windowPath == '/home' || windowPath == '/'
                $('[href="/home"]').addClass('active')
                Header.setAsActiveBtn $('[href="/home"]')
            else
                _(paths).each (path) ->
                    if path == windowPath
                        Header.setAsActiveBtn $('[href="' + path + '"]')
                        Header.setAsActiveBtn $('[href="' + path + hash + '"]')
                        $('[href="' + path + '"]').closest('ul.submenu') if $('[href="' + path + '"]').closest('.submenu')

        # Adds click callback for setting the active button when the request
        # is resolved in the client side
        _initializeMobileActiveBtn: ->
            js_buttons_li = $('.js-button-li')
            js_buttons_li.children('a').click ->
                $('#build-menu-overlay').trigger('click')
                js_buttons_li.each (i,e) ->
                    $(e).removeClass('active')
                Header.setAsActiveBtn $(this)

        _defineMode: ->
            $.get window.location.origin + "/em", (response) ->
                if response.em_mode
                    $('.mobile-menu .normal-mode').hide()
                    $('.mobile-menu .crisis-mode').show()

        init: ->
            $( ->
                Header._initializeMobileMenu()
                Header._initializeMobileActiveBtn()
                Header._initializeActiveButton()
                Header._defineMode()
            )
    
    Header.init()       

)
