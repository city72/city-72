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
      $modalEl = $element.children('.edit-partner');

      $scope.$watch('resource', function () {
        if ($scope.resource) {
          $scope.resourceInEdition = _($scope.resource).clone();
          $modalEl.modal('show');
        } else {
          $modalEl.modal('hide');
        }
      });
    },
    templateUrl: '/cms/directives/resource_modal'
  };
}]);
