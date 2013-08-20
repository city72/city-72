Sf72 = {} || Sf72

jQuery ((Sf72) ->

    Header = 

        _setAsActiveBtn: (elem) ->
            $(elem).parent('li').addClass('active')

        _initializeMobileMenu: ->
            $("body").mobile_menu({
                menu: '.mobile-menu',
                menu_width: 270,
                prepend_button_to: '.header'
            });
                
        _initializeActiveButton: ->
            windowPath = window.location.pathname
            hash = window.location.hash
            paths = _($('.header a')).pluck 'pathname'

            if windowPath == '/home' || windowPath == '/'
                $('[href="/home"]').addClass('active')
                Header._setAsActiveBtn $('[href="/home"]')
            else
                _(paths).each (path) ->
                    if path == windowPath
                        Header._setAsActiveBtn $('[href="' + path + '"]')
                        Header._setAsActiveBtn $('[href="' + path + hash + '"]')
                        $('[href="' + path + '"]').closest('ul.submenu') if $('[href="' + path + '"]').closest('.submenu')

        _initializeMobileActiveBtn: ->
            js_buttons_li = $('.js-button-li')
            js_buttons_li.children('a').click ->
                $('#build-menu-overlay').trigger('click')
                js_buttons_li.each (i,e) ->
                    $(e).removeClass('active')
                Header._setAsActiveBtn $(this)

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
    
    Sf72.Header = Header       

)(Sf72)

Sf72.Header.init()
