backofficeApp.factory('cmsService', ['$resource', '$upload', '$q', function ($resource, $upload, $q) {

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

    updateConnection: function (connection, callback, errorCallback) {
      connection.twitter_accounts_attributes = connection.twitter_accounts ? connection.twitter_accounts : [];
      connection.city_networks_attributes = connection.city_networks ? connection.city_networks : [];
      connection.city_resources_attributes = connection.city_resources ? connection.city_resources : [];
      connection = _(connection).omit('id', 'twitter_accounts', 'city_networks', 'city_resources');

      var uploadsNetwork = [];
      var uploadsResource = [];

      _(connection.city_networks_attributes).map(function (network, index) {
        network.index = index;

        uploadsNetwork.push(network.logo);
        delete network.logo;
        delete network.new_image;
        delete network.logo_url;
      });

      _(connection.city_resources_attributes).each(function (resource, index) {
        resource.index = index;
        uploadsResource.push(resource.logo);
        delete resource.logo;
        delete resource.new_image;
        delete resource.logo_url;
      });

      return $upload.upload({
        method: 'PUT',
        url: '/cms/city_connections',
        data: {city_connection: connection}
      }).then(function(data) {
        data = data.data;

        var promises = [];

        _(data.city_connection.city_networks).each(function(cnet, i) {
          var logo = uploadsNetwork[i];

          if(logo != null) {
            promises.push($upload.upload({
              method: 'PUT',
              url: '/cms/city_network/' + cnet.id,
              file: logo,
              fileFormDataName: "logo"
            }));
          }
        });

        _(data.city_connection.city_resources).each(function(crec, i) {
          var logo = uploadsResource[i];

          if(logo != null) {
            promises.push($upload.upload({
              method: 'PUT',
              url: '/cms/city_resource/' + crec.id,
              file: logo,
              fileFormDataName: "logo"
            }));
          }
        });

        return $q.all(promises).then(
          function(responses) {
            return $upload.upload({
              method: 'GET',
              url: '/cms/city_connections.json',
            }).then(callback, errorCallback);
          },
          errorCallback
        );
      }, errorCallback);

    },

    updateSupplies: function (essentials, usefuls, personals, kits) {
      var allSupplies = _(essentials).chain().union(usefuls).union(personals).value();
      var promises = [];

      _(allSupplies).map(function (supply, index) {
        supply.index = index;

        var uploadInfo = {
          method: 'PUT',
          url: '/cms/supplies/'+supply.id,
          data: {item: supply}
        };

        if(supply.image) {
          uploadInfo.file = supply.image
          uploadInfo.fileFormDataName = "image";
        }

        promises.push($upload.upload(uploadInfo));
      });

      _(kits).map(function (kit, index) {
        kit.index = index;

        var uploadInfo = {
          method: 'PUT',
          url: '/cms/supplies/kit/'+kit.id,
          data: {kit: kit}
        };

        if(kit.image) {
          uploadInfo.file = kit.image
          uploadInfo.fileFormDataName = "image";
        }

        promises.push($upload.upload(uploadInfo));
      });

      return $q.all(promises);
    },

    updateStories: function (stories, city) {

      var uploads = [];
      var names = [];
      var index = 0;
      var name;

      _(stories).each(function (story) {
        if (story.image) {
          index = index + 1;
          uploads.push(story.image);
          name = 'story-' + index;
          names.push(name);
          story.image_name = name;
        }
      })

      return $upload.upload({
        method: 'PUT',
        url: '/cms/stories',
        file: uploads,
        data: {stories: stories, city: city},
        fileFormDataName: names
      });

    }
  }

}]);