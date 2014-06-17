backofficeApp.controller('CitySuppliesController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.initialize = function (essentials, usefuls, personals, kits) {
    $scope.essentials = JSON.parse(essentials);
    $scope.usefuls = JSON.parse(usefuls);
    $scope.personals = JSON.parse(personals);
    $scope.kits = JSON.parse(kits);
  };

}]);
