backofficeApp.directive('affiliateForm', function () {

  return {
    restrict: 'E',
    scope: {
      affiliate: '=',
      affiliates: '='
    },
    controller: ['$scope', function ($scope) {
      $scope.removeAffiliate = function () {
        var affiliatePosition = $scope.affiliates.indexOf($scope.affiliate);
        $scope.affiliates.splice(affiliatePosition, 1);
      };
    }],
    template: 
      '<div class="form-group">' +
        '<label class="control-label">' +
          'Name of Affiliate' + 
          '<span class="help">(name and corresponding URL)</span>' + 
        '</label>' +
        '<input type="text" class="form-control" placeholder="name@example.com" value="{{affiliate.name}}" />' +
        '<div class="input-group">' +
          '<span class="input-group-addon">http://</span>' +
          '<input class="form-control" type="text" />' +
        '</div>' + 
        '<button class="btn btn-danger btn-xs" ng-click="removeAffiliate()"><i class="glyphicon glyphicon-remove"></i> Remove</button>' +
      '</div>'
  }

});
