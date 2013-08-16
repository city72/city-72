Sf72 = {} || Sf72
jQuery ((Sf72) ->

    Header = 
        _setAsActiveBtn: (elem) ->
            $(elem).parent('li').addClass('active')

        _initializeActiveBtn: ->
            windowPath = window.location.pathname
            hash = window.location.hash
            paths = _($('.header a')).pluck 'pathname'

            if windowPath == '/home' || windowPath == '/'
                homeLinks = $('[href="/home"]')
                homeLinks.addClass('active')
                homeLinks.parent('li').addClass('active')
            else
                _(paths).each (path) ->
                    if path == windowPath
                        this._setAsActiveBtn $('[href="' + path + '"]')
                        this._setAsActiveBtn $('[href="' + path + hash +'"]')
                        this._setAsActiveBtn $('[href="' + path + '"]').closest('ul.submenu') if $('[href="' + path + '"]').closest('.submenu')

        _initializeMobileMenuPlugin: ->
            $("body").mobile_menu {
                menu: '.mobile_menu', 
                menu_width: 270, 
                prepend_button_to: '.header'
            }

        _initializeMobileActiveBtn: ->
            js_buttons_li = $('.js-button-li')
            js_buttons_li.children('a').click ->
            $('#build-menu-overlay').trigger('click')
            js_buttons_li.each (i,e) ->
                $(e).removeClass('active')
            $(this).parent('li').addClass('active')

        _defineMode: ->
            $.get window.location.origin + "/em", (response) ->
                if response.em_mode
                    $('.mobile-menu .normal-mode').hide()
                    $('.mobile-menu .crisis-mode').show()

        init: ->
            this._initializeMobileMenuPlugin()
            this._initializeActiveBtn()
            this._initializeMobileActiveBtn()
            this._defineMode()

    Sf72.Header = Header       
    console.log "Header initialized"
)(Sf72)

Sf72.Header.init()

    # windowPath = window.location.pathname
    # hash = window.location.hash

    # paths = _($('.header a')).pluck 'pathname'

    # if windowPath == '/home' || windowPath == '/'
    #     homeLinks = $('[href="/home"]')
    #     homeLinks.addClass('active')
    #     homeLinks.parent('li').addClass('active')
    # else
    #     _(paths).each (path) ->
    #         if path == windowPath
    #             $('[href="' + path + '"]').parent('li').addClass('active')
    #             $('[href="' + path + hash + '"]').parent('li').addClass('active') if hash
    #             #if link is in a submenu, also set active to parent li
    #             if $('[href="' + path + '"]').closest('.submenu')
    #                 $('[href="' + path + '"]').closest('ul.submenu').parent('li').addClass('active')

    # $.get window.location.origin + "/em", (response) ->
    #     if response.em_mode
    #         $('.mobile-menu .normal-mode').hide()
    #         $('.mobile-menu .crisis-mode').show()

    # # Setting the active button when page doesn't reload