angular.module('DigApp').controller 'DigCtrl', ($scope, Dig, dig, Comment) ->
  $scope.dig = dig.data
  $scope.shown = false
  $scope.newComment = {}
  Comment.index($scope.dig.id).success (respond) ->
    $scope.comments = respond

  $scope.show = ->
    $scope.shown = true

  $scope.hide = ->
    $scope.shown = false

  $scope.comment = ->
    $scope.newComment.dig_id = $scope.dig.id
    Comment.create($scope.dig.id, $scope.newComment).success (response) ->
      $scope.comments.push response
      $scope.newDig = {}

