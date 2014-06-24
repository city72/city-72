backofficeApp.controller('CityStoriesController', ['$scope', 'cmsService', function ($scope, cmsService) {

  $scope.storyInEdition = null;
  $scope.updating = false;
  $scope.fatalError = false;

  $scope.initialize = function (city, stories) {
    $scope.city = JSON.parse(city).city;
    $scope.stories = JSON.parse(stories);

    $scope.$watch('stories', function () {
      if (_.isArray($scope.stories)) {
        $scope._bindStories();
      }
    }, true);
  };

  $scope.callToAction = function (story) {
    var title;
    switch(story.call_to_action_cd) {
      case 0:
        title = "Get Connected"; break;
      case 1:
        title = "Gather Supplies"; break;
      case 2:
        title = "Make a Plan"; break;
    }
    return title;
  };

  $scope.editStory = function (story) {
    $scope.storyInEdition = story;
  };

  $scope._bindStories = function () {
    $scope.selectedStory = $scope._selectedStory();
    $scope.notSelectedStories = $scope._notSelectedStories($scope.selectedStory);
  };

  $scope._selectedStory = function () {
    return _($scope.stories).chain().filter(function (story) {
      return story.selected;
    }).first().value();
  }

  $scope._notSelectedStories = function (selectedStory) {
    return _($scope.stories).difference([selectedStory]);
  };

  $scope.save = function () {
    $scope.updating = true;
    $scope.fatalError = false;
    cmsService.updateStories($scope.stories, $scope.city).then(
      function () {
        $scope.updating = false;
        window.location.reload();
      },
      function () {
        $scope.updating = false;
        $scope.fatalError = true;
      }
    );
  };

}]);
