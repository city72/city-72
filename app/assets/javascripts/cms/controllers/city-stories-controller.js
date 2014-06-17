backofficeApp.controller('CityStoriesController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.initialize = function (city, stories) {
    $scope.city = JSON.parse(city).city;
    var allStories = JSON.parse(stories);
    var selectedStory = _(allStories).filter(function (story) {return story.selected});
    $scope.stories = _(allStories).difference(selectedStory);
    $scope.selectedStory = _(selectedStory).first();
  };

  $scope.callToAction = function (story) {
    var title;
    switch(story.call_to_action_cd) {
      case 0:
        title = "Get Connected"; break;
      case 1:
        title = "Gather Supplies"; break;
      case 2:
        title = "Make a plan"; break;
    }
    return title;
  };

}]);
