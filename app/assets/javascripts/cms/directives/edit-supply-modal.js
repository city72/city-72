backofficeApp.directive('editSupplyModal', [function () {

  return {
    restrict: 'E',
    scope: {
      supply: '=',
      supplies: '='
    },
    controller: ['$scope', function ($scope) {
      $scope.save = function () {
        var supplyIndex = _($scope.supplies).indexOf($scope.supply);
        $scope.supplies[supplyIndex] = $scope.supplyInEdition;
        $scope.supply = null;
      };

      $scope.cancel = function () {
        $scope.supply = null;
      };

    }],
    link: function ($scope, $element, $attrs) {
      $modalEl = $element.children('#edit-supple');

      $scope.$watch('supply', function () {
        if ($scope.supply) {
          $scope.supplyInEdition = _($scope.supply).clone();
          $modalEl.modal('show');
        } else {
          $modalEl.modal('hide');
        }
      });
    },
    templateUrl: '/cms/directives/supply_modal'
  };

}]);
