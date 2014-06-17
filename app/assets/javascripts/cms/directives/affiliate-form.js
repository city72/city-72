backofficeApp.directive('affiliateForm', function () {

  return {
    restrict: 'E',
    scope: {
      affiliate: '=',
      affiliates: '='
    },
    controller: ['$scope', function ($scope) {
      $scope.removeAffiliate = function () {
        $scope.affiliate._destroy = 1;
      };
    }],
    templateUrl: '/cms/directives/affiliate_form'
  }

});
