backofficeApp.controller('CitySuppliesController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.supplyInEdition = null;
  $scope.suppliesInEdition = null;

  $scope.initialize = function (essentials, usefuls, personals, kits) {
    $scope.essentials = JSON.parse(essentials);
    $scope.usefuls = JSON.parse(usefuls);
    $scope.personals = JSON.parse(personals);
    $scope.kits = JSON.parse(kits);
  };

  $scope.editSupply = function (supply, supplies) {
    $scope.supplyInEdition = supply;
    $scope.suppliesInEdition = supplies;
  };

}]);
