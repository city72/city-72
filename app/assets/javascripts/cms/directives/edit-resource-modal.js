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
        if ($scope.resourceInEdition.logo) {
          $scope.resourceInEdition.new_image = true;
        } else {
          $scope.resourceInEdition.new_image = false;
        }
        if ($scope.newResource) {
          $scope.resourceInEdition.included = false;
          $scope.resources.push($scope.resourceInEdition);
          $scope.newResource = false;
        } else {
          var resourceIndex = _($scope.resources).indexOf($scope.resource);
          $scope.resources[resourceIndex] = $scope.resourceInEdition;
        }
        $scope.resource = null;
      };

      $scope.cancel = function () {
        var resourceIndex = _($scope.resources).indexOf($scope.resource);
        $scope.resources[resourceIndex].new_image = false;
        $scope.resource = null;
      };
    }],
    link: function ($scope, $element, $attrs) {
      $scope.$modalEl = $element.children('#resourceModal');

      $scope.$watch('resource', function () {
        if ($scope.resource) {
          $element.find("#partner-image").val("");
          $scope.logoFile = null;
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
