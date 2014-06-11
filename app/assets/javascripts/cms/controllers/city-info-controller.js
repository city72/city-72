backofficeApp.controller('CityInfoController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.initialize = function (cityJson, availableColors) {
    $scope.city = JSON.parse(cityJson);
    $scope.availableColors = [];
    var colors = JSON.parse(availableColors);
    _(colors).chain().keys().each(function (color) {
      $scope.availableColors.push({key: colors[color], value: color});
    });
  }

  $scope.updateCity = function () {
    $scope.updating = true;
    cmsService.updateCity($scope.city).then(function () {
      $scope.updating = false;
    });
  }

}]);
