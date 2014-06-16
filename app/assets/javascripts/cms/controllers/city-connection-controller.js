backofficeApp.controller('CityConnectionController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.networkInEdition = null;

  $scope.initializer = function (cityConnectionJson, allNetworksJson) {
    $scope.connection = JSON.parse(cityConnectionJson).city_connection;
    $scope.networks = JSON.parse(allNetworksJson)
  };

  $scope.updateConnection = function () {
    $scope.updating = true;
    cmsService.updateConnection($scope.connection)
    .then(
      function () {
        $scope.updating = false;
      },
      function () {
        $scope.fatalError = true;
        $scope.updating = false;
      }
    );
  };

  $scope.addTwitterAccount = function () {
    if (!$scope.connection.twitter_accounts) {
      $scope.connection.twitter_accounts = [];
    }
    $scope.connection.twitter_accounts.push({});
  };

  $scope.removeTwitterAccount = function (twitterAccount) {
    twitterAccount._destroy = 1;
  };

  $scope.editNetwork = function (network) {
    $scope.networkInEdition = network;
  };

}]);
