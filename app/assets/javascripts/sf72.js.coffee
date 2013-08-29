class Utils
    setAsActiveBtn: (elem) ->
        $(elem).parent('li').addClass 'active'

    isMobile: ->
      $(window).width() < 480 or $(window).height() < 480

    redirectTo: (path) ->
      window.location = path

class @Sf72
    @Utils = new Utils