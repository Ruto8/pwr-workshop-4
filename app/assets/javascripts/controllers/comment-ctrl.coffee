angular.module('DigApp').controller 'CommentCtrl', ($state, $scope, Comment, comment) ->
  $scope.comment = comment.data
  $scope.editing = false

  $scope.cancelEdit = ->
    $scope.editing = false

  $scope.edit = ->
    $scope.editing = true

  $scope.update = (comment) ->
    Comment.update($scope.comment.dig_id, $scope.comment).success (response) ->
      # Replace current object with one returned by back-end
      $scope.comment = response
      $scope.editing = false
  $scope.back = ->
    $state.go('dig', { id: $scope.comment.dig_id })
