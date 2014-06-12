backofficeApp.factory('cmsService', ['$resource', function ($resource) {

  var City = $resource('/cms/city', null, {
    'update': {method: 'PUT'},
  });

  return {
    updateCity: function (city) {
      
      if (city.affiliates) {
        city.affiliates_attributes = city.affiliates;
      } else {
        city.affiliates_attributes = [];
      }
    
      return City.update(city).$promise;
    }
  }

}]);