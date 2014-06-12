backofficeApp.factory('cmsService', ['$resource', function ($resource) {

  var City = $resource('/cms/city', null, {
    'update': {method: 'PUT'},
  });

  return {
    updateCity: function (city) {
      return City.update(city).$promise;
    }
  }

}]);