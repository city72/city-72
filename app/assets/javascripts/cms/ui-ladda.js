angular.module('ui.ladda', []).directive('uiLadda', ['$timeout', function($timeout) {
    return {
        link: function(scope, element, attrs) {
            var ladda = Ladda.create(element[0]);
            scope.$watch(attrs.uiLadda, function(newVal) {
                if (angular.isNumber(newVal)) {
                    if (newVal >= 0 && newVal < 1) {
                        if (!ladda.isLoading()) {
                            ladda.start();
                            $timeout(function() {
                                ladda.setProgress(newVal);
                            }, 300);
                        }
                        else {
                            ladda.setProgress(newVal);
                        }
                    }
                    else {
                        if (ladda.isLoading()) {
                            ladda.stop();
                        }
                    }
                }
                else {
                    if (newVal) {
                        if (!ladda.isLoading()) {
                            ladda.start();
                        }
                    }
                    else {
                        if (ladda.isLoading()) {
                            ladda.stop();
                        }
                    }
                }
            }, true);
        }
    };
}]);
