angular.module('DigApp').controller 'CommentsCtrl', ($scope, Comment, comments) ->
  $scope.comments = comments.data

