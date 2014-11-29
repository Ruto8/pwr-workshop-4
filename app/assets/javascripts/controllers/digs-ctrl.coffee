angular.module('DigApp').controller 'DigsCtrl', ($scope, Dig, digs) ->
  $scope.digs = digs.data
  $scope.newDig = {}
  $scope.editedDigID = null

  $scope.create = ->
    Dig.create({ dig: $scope.newDig }).success (response) ->
      $scope.digs.push response
      $scope.newDig = {}

  $scope.edit = (dig) ->
    $scope.editedDigID = dig.id

  $scope.cancelEdit = ->
    $scope.editedDigID = null

  $scope.update = (dig) ->
    Dig.update(dig).success (response) ->
      # Replace current object with one returned by back-end
      index = $scope.digs.indexOf(dig)
      $scope.digs.splice(index, 1, dig)
      $scope.editedDigID = null

  $scope.destroy = (dig) ->
    Dig.delete(dig).success (response) ->
      index = $scope.digs.indexOf(dig)
      $scope.digs.splice(index, 1)

  $scope.vote = (dig, amount) ->
    Dig.vote(dig, amount).success (response) ->
      dig.rating = dig.rating + amount
