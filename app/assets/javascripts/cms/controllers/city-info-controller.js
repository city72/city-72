backofficeApp.controller('CityInfoController', ['$scope', 'cmsService', '$upload', function ($scope, cmsService) {

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
    
    cmsService.updateCity($scope.city, $scope.city_image, $scope.resident_image)
    .then(
      function (response) {
        $scope.updating = false;
        $scope.city = response.data.city;
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

  $scope.cityImageChanged = function (elm) {
    $scope.$apply(function () {
      $scope.uploads.city_image = elm.file;
    });
  };

}]);
