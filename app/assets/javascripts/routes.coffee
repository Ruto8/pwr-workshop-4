angular.module('DigApp').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'index',
      url: '/'
      controller: 'DigsCtrl'
      templateUrl: '/assets/index.html'
      resolve:
        digs: (Dig) ->
          Dig.index()

    .state 'dig',
      url: '/dig/:id'
      controller: 'DigCtrl'
      templateUrl: '/assets/dig.html'
      resolve:
        dig: (Dig, $stateParams) ->
          Dig.show($stateParams.id)

    .state 'comments',
      url: '/dig/:dig_id/comments'
      controller: 'CommentsCtrl'
      templateUrl: '/assets/comments.html'
      resolve:
        comments: (Comment, $stateParams) ->
          Comment.index($stateParams.dig_id)

    .state 'comment',
      url: '/dig/:dig_id/comment/:com_id'
      controller: 'CommentCtrl'
      templateUrl: '/assets/comment.html'
      resolve:
        comment: (Comment, $stateParams) ->
          Comment.show($stateParams.dig_id, $stateParams.com_id)

