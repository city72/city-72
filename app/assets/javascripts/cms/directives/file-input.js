backofficeApp.directive('fileInput', ['$parse', function ($parse) {
  return {
    restrict: "EA",
    template: "<input type='file' />",
    replace: true,          
    link: function (scope, element, attrs) {

        var modelGet = $parse(attrs.fileInput);
        var modelSet = modelGet.assign;
        var onChange = $parse(attrs.onChange);

        var updateModel = function () {
            scope.$apply(function () {
                modelSet(scope, element[0].files[0]);
                onChange(scope);
            });                    
        };
         
        element.bind('change', updateModel);
    }
  };
}]);
