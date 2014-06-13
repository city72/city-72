backofficeApp.factory('cmsService', ['$resource', function ($resource) {

  var City = $resource('/cms/city', null, {
    'update': {method: 'PUT'},
  });

  var Connection = $resource('/cms/connections', null, {
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
    },

    updateConnection: function (connection) {
      return Connection.update(connection).$promise;
    }
  }

}]);