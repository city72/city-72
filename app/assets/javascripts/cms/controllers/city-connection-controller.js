backofficeApp.controller('CityConnectionController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.networkInEdition = null;
  $scope.addingNewNetwork = false;

  $scope.resourceInEdition = null;
  $scope.addingNewResource = false;

  $scope.initializer = function (cityConnectionJson) {
    $scope.connection = JSON.parse(cityConnectionJson).city_connection;
  };

  $scope.orderedNetworks = function () {
    return _($scope.connection.city_networks).sortBy(function (network) {
      return +network.id;
    });
  };

  $scope.networksCountNotReached =  function() {
    return $scope.connection.city_networks.length < 3
  };

  $scope.orderedResources = function () {
    return _($scope.connection.city_resources).sortBy(function (resource) {
      return +resource.id;
    });
  };

  $scope.resourcesCountNotReached =  function() {
    return $scope.connection.city_resources.length < 6
  };

  $scope.updateConnection = function () {
    $scope.updating = true;
    $scope.updatedSuccessfully = false;
    $scope.fatalError = false;
    $scope.errorText = "";

    cmsService.updateConnection($scope.connection)
    .then(
      function (response) {
        $scope.updating = false;
        $scope.updatedSuccessfully = true;
        $scope.connection = response.data.city_connection;
      },
      function (response) {
        var error = response.data;
        if(error.city_networks_count && error.city_networks_count[0]) {
          $scope.errorText = error.city_networks_count[0] + " ";
        }
        if(error.city_resources_count && error.city_resources_count[0]) {
          $scope.errorText = $scope.errorText + error.city_resources_count[0];
        }
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

  $scope.newNetwork = function () {
    $scope.addingNewNetwork = true;
    $scope.networkInEdition = {};
  };

  $scope.editResource = function (resource) {
    $scope.resourceInEdition = resource;
  };

  $scope.newResource = function () {
    $scope.addingNewResource = true;
    $scope.resourceInEdition = {};
  };

}]);
