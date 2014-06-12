backofficeApp.controller('CityInfoController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.initialize = function (cityJson, availableColors) {
    $scope.city = JSON.parse(cityJson).city;
    $scope.availableColors = [];
    var colors = JSON.parse(availableColors);
    _(colors).chain().keys().each(function (color) {
      $scope.availableColors.push({key: colors[color], value: color});
    });
  }

  $scope.updateCity = function () {
    $scope.updating = true;
    cmsService.updateCity($scope.city).then(
      function () {
        $scope.updating = false;
      },
      function () {
        $scope.fatalError = true;
        $scope.updating = false;
      }
    );
  };

  $scope.newAffiliate = function () {
    if (!$scope.city.affiliates) {
      $scope.city.affiliates = [];
    }
    $scope.city.affiliates.push({});
  }

}]);
