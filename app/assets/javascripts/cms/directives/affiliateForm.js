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
    template: 
      '<div class="form-group" ng-hide="affiliate._destroy">' +
        '<label class="control-label">' +
          'Name of Affiliate' + 
          '<span class="help">(name and corresponding URL)</span>' + 
        '</label>' +
        '<input type="text" class="form-control" placeholder="name@example.com" ng-model="affiliate.name" required />' +
        '<div class="input-group">' +
          '<span class="input-group-addon">http://</span>' +
          '<input class="form-control" type="text" ng-model="affiliate.url" required />' +
        '</div>' + 
        '<button class="btn btn-danger btn-xs" ng-click="removeAffiliate()"><i class="glyphicon glyphicon-remove"></i> Remove</button>' +
      '</div>'
  }

});
