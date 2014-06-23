backofficeApp.factory('cmsService', ['$resource', '$upload', function ($resource, $upload) {

  var Connection = $resource('/cms/city_connections', null, {
    'update': {method: 'PUT'},
  });

  var Supplies = $resource('/cms/supplies', null, {
    'update': {method: 'PUT'},
  });

  var Stories = $resource('/cms/stories', null, {
    'update': {method: 'PUT'},
  });

  return {
    updateCity: function (city, cityImage, residentImage) {

      var uploads = [];
      var names = [];
      
      if (!_.isEmpty(cityImage)) {
        uploads.push(cityImage);
        names.push('city_image');
      }
      if (!_.isEmpty(residentImage)) {
        uploads.push(residentImage);
        names.push('resident_image');
      }

      city.affiliates_attributes = city.affiliates ? city.affiliates : [];

      return $upload.upload({
        method: 'PUT',
        url: '/cms/city',
        file: uploads,
        data: {city: city},
        fileFormDataName: names
      });
    },

    updateConnection: function (connection) {
      connection.twitter_accounts_attributes = connection.twitter_accounts ? connection.twitter_accounts : [];
      connection.city_networks_attributes = connection.city_networks ? connection.city_networks : [];
      connection.city_resources_attributes = connection.city_resources ? connection.city_resources : [];

      connection = _(connection).omit('id', 'twitter_accounts', 'city_networks', 'city_resources');
      
      var uploads = [];
      var names = [];
      var index = 0;
      var name;

      _(connection.city_networks_attributes)
      .each(function (network) {
        if (network.logo) {
          index = index + 1;
          uploads.push(network.logo);
          name = 'network-logo-' + index;
          names.push(name);
          network.logo_name = name;
        }
      });

      index = 0;
      _(connection.city_resources_attributes)
      .each(function (resource) {
        if (resource.logo) {
          index = index + 1;
          uploads.push(resource.logo);
          name = 'resource-logo-' + index;
          names.push(name);
          resource.logo_name = name;
        }
      });

      return $upload.upload({
        method: 'PUT',
        url: '/cms/city_connections',
        file: uploads,
        data: {city_connection: connection},
        fileFormDataName: names
      });

    },

    updateSupplies: function (essentials, usefuls, personals) {
      var allSupplies = _(essentials).chain().union(usefuls).union(personals).value();

      var uploads = [];
      var names = [];
      var index = 0;
      var name;

      _(allSupplies).each(function (supply) {
        if (supply.image) {
          index = index + 1;
          uploads.push(supply.image);
          name = 'supply-' + index;
          names.push(name);
          supply.image_name = name;
        }
      });

      return $upload.upload({
        method: 'PUT',
        url: '/cms/supplies',
        file: uploads,
        data: {supplies: allSupplies},
        fileFormDataName: names
      });

    },

    updateStories: function (stories, city) {
      return Stories.update({stories: stories, city: city}).$promise;
    }
  }

}]);