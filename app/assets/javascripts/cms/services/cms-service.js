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

      if (connection.twitter_accounts) {
        connection.twitter_accounts_attributes = connection.twitter_accounts;
      } else {
        connection.twitter_accounts_attributes = [];
      }

      return Connection.update(connection).$promise;
    }
  }

}]);