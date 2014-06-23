backofficeApp.directive('editResourceModal', [function () {
  
  return {
    restrict: 'E',
    scope: {
      resource: '=',
      resources: '=',
      newResource: '='
    },
    controller: ['$scope', function ($scope) {
      $scope.save = function () {
        $scope.resourceInEdition.logo = $scope.logoFile;
        if ($scope.newResource) {
          $scope.resourceInEdition.included = true;
          $scope.resources.push($scope.resourceInEdition);
          $scope.newResource = false;
        } else {
          var resourceIndex = _($scope.resources).indexOf($scope.resource);
          $scope.resources[resourceIndex] = $scope.resourceInEdition;
        }
        $scope.resource = null;
      };

      $scope.cancel = function () {
        $scope.resource = null;
      };
    }],
    link: function ($scope, $element, $attrs) {
      $scope.$modalEl = $element.children('#resourceModal');

      $scope.$watch('resource', function () {
        if ($scope.resource) {
          $scope.logoFile = $scope.resource.logo ? $scope.resource.logo : null;
          $scope.resourceInEdition = _($scope.resource).clone();
          $scope.$modalEl.modal('show');
        } else {
          $scope.$modalEl.modal('hide');
        }
      });
    },
    templateUrl: '/cms/directives/resource_modal'
  };
  
}]);
