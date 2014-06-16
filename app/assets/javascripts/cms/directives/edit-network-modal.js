backofficeApp.directive('editNetworkModal', ['cmsService', function (cmsService) {

  return {
    restrict: 'E',
    scope: {
      network: '=',
      networks: '=',
      newNetwork: '='
    },
    controller: ['$scope', function ($scope) {

      $scope.save = function () {
        if ($scope.newNetwork) {
          $scope.networkInEdition.included = true;
          $scope.networks.push($scope.networkInEdition);
          $scope.newNetwork = false;
        } else {
          var networkIndex = _($scope.networks).indexOf($scope.network);
          $scope.networks[networkIndex] = $scope.networkInEdition;
        }
        $scope.network = null;
      };

      $scope.cancel = function () {
        $scope.network = null;
      };

    }],
    link: function ($scope, $element, $attrs) {
      $modalEl = $element.children('.edit-network');

      $scope.$watch('network', function () {
        if ($scope.network) {
          $scope.networkInEdition = _($scope.network).clone();
          $modalEl.modal('show');
        } else {
          $modalEl.modal('hide');
        }
      });
    },
    templateUrl: '/cms/directives/network_modal'
  };

}]);
