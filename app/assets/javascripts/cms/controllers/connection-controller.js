backofficeApp.controller('ConnectionController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.initializer = function (connectionJson) {
    $scope.connection = JSON.parse(connectionJson).connection;
  };

  $scope.updateConnection = function () {
    $scope.updating = true;
    cmsService.updateConnection($scope.connection).then(
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

}]);
