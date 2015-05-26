angular.module('whats-that-language', [])
.controller('Game', function($scope, $http, $window) {
  $scope.getNew = function() {
    $http.get('/new')
    .success(function(data, status, headers, config) {
      $scope.code = data.code;
      $scope.options = data.options;
      $scope.language = data.language;
      $scope.extension = data.extension;
    })
    .error(function(data, status, headers, config) {
      $scope.code = "Could not load language! (code: " + status + ")";
      $scope.language = "na";
      $scope.getNew();
    });

    $window.hasHighlighted = false;
  };

  $scope.answer = function(option) {
    if (option == $scope.language) $scope.ScoreKeeper.addScore(100);
    else $scope.ScoreKeeper.subtractScore(100);
    $scope.getNew();
  };

  $scope.ScoreKeeper = $window.ScoreKeeper;
  $scope.getNew();
});

/**
 * Timer that checks to see if the code needs to be highlighted
 */
var highlight = function() {
  if (!window.hasHighlighted) {
      hljs.highlightBlock(document.getElementById('code'));
      window.hasHighlighted = true;
  }
};

setInterval(highlight, 250);
