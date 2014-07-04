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
        $scope.networkInEdition.logo = $scope.logoFile;
        if ($scope.networkInEdition.logo) {
          $scope.networkInEdition.new_image = true; // Removes the image from the network box
        } else {
          $scope.networkInEdition.new_image = false;
        }
        if ($scope.newNetwork) {
          $scope.networkInEdition.included = false;
          $scope.networks.push($scope.networkInEdition);
          $scope.newNetwork = false;
        } else {
          var networkIndex = _($scope.networks).indexOf($scope.network);
          $scope.networks[networkIndex] = $scope.networkInEdition;
        }
        $scope.network = null;
      };

      $scope.cancel = function () {
        var networkIndex = _($scope.networks).indexOf($scope.network);
        $scope.networks[networkIndex].new_image = false;
        $scope.network = null;
      };


    }],
    link: function ($scope, $element, $attrs) {
      $modalEl = $element.children('#networkModal');

      $scope.$watch('network', function () {
        if ($scope.network) {
          $element.find("#network-image").val("");
          $scope.logoFile = null;
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
