backofficeApp.directive('affiliateForm', function () {

  return {
    restrict: 'E',
    scope: {
      affiliate: '=',
      affiliates: '='
    },
    controller: ['$scope', function ($scope) {
      $scope.removeAffiliate = function () {
        if ($scope.affiliate.id) {
          $scope.affiliate._destroy = 1;
        } else {
          var index = _($scope.affiliates).indexOf($scope.affiliate);
          $scope.affiliates.splice(index, 1);
        }
      };
    }],
    templateUrl: '/cms/directives/affiliate_form'
  }

});
