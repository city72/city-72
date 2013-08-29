class Utils
    setAsActiveBtn: (elem) ->
        $(elem).parent('li').addClass 'active'

    isMobile: ->
      $(window).width() < 480 && $(window).height() < 480

    redirectTo: (path) ->
      window.location = path

    isOldInternetExplorer: ->
      $.browser.msie && $.browser.version < 9

class @Sf72
    @Utils = new Utils