class Utils
    setAsActiveBtn: (elem) ->
        $(elem).parent('li').addClass 'active'

class @Sf72
    @Utils = new Utils