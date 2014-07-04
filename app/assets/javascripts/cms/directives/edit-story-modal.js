backofficeApp.directive('editStoryModal', function () {

  return {
    restrict: 'E',
    scope: {
      story: '=',
      stories: '='
    },
    controller: ['$scope', function ($scope) {

      $scope.save = function () {
        $scope.storyInEdition.image = $scope.storyImage;
        if ($scope.storyInEdition.image) {
          $scope.storyInEdition.new_image = true;
        } else {
          $scope.storyInEdition.new_image = false;
        }
        var storyIndex = _($scope.stories).indexOf($scope.story);
        $scope.stories[storyIndex] = $scope.storyInEdition;
        $scope.story = null;
      };

      $scope.cancel = function () {
        var storyIndex = _($scope.stories).indexOf($scope.story);
        $scope.stories[storyIndex].new_image = false;
        $scope.story = null;
      };

    }],
    link: function ($scope, $element, $attrs) {
      $modalEl = $element.children('#edit-story');

      $scope.$watch('story', function () {
        if ($scope.story) {
          $element.find("#story-image").val("");
          $scope.storyImage = null;
          $scope.storyInEdition = _($scope.story).clone();
          $modalEl.modal('show');
        } else {
          $modalEl.modal('hide');
        }
      });

    },
    templateUrl: '/cms/directives/story_modal'
  };

});
