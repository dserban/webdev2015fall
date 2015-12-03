{% raw %}
'use strict';

var app = angular.module('MemeGameApp', []);

app.controller('MemeGameAppController', ['$scope', function($scope) {
  // begin

  $scope.gridAsHash = {
    'img0': 'http://cdn.meme.am/instances/500x/65183929.jpg',
    'img1': 'http://cdn.meme.am/instances/500x/65268240.jpg',
    'img2': 'http://cdn.meme.am/instances/500x/65268144.jpg',
    'img3': 'http://cdn.meme.am/instances/500x/15057142.jpg',
    'img4': 'http://cdn.meme.am/instances/500x/65183929.jpg',
    'img5': 'http://cdn.meme.am/instances/500x/65268240.jpg',
    'img6': 'http://cdn.meme.am/instances/500x/65268144.jpg',
    'img7': 'http://cdn.meme.am/instances/500x/15057142.jpg'
  };
  $scope.gridLayout = [ [ 'img0', 'img1', 'img2', 'img3' ],
                        [ 'img4', 'img5', 'img6', 'img7' ] ];
  $scope.imageURLToAdd = '';
  $scope.showErrorMessage = false;

  var connectTo = 'http://' + document.domain + ':' + location.port;
  var socketioClient = io.connect(connectTo);

  function contributeImageURL() {
    socketioClient.emit('browser_contributing_an_image_url', { 'url': $scope.imageURLToAdd });
    $scope.showErrorMessage = false;
  }
  $scope.contributeImageURL = contributeImageURL;

  function updateGrid(jsonFromServer) {
    var gridID = jsonFromServer['grid_id'];
    var url = jsonFromServer['url'];
    $scope.gridAsHash[gridID] = url;
    $scope.imageURLToAdd = '';
    $scope.$apply();
  }

  socketioClient.on('server_broadcasting_new_image_url', updateGrid);

  function showFeedbackForBadURL(jsonFromServer) {
    $scope.showErrorMessage = true;
    $scope.$apply();
  }

  socketioClient.on('server_signalling_bad_url', showFeedbackForBadURL);

  // end

  window.sc = $scope;

}]);
{% endraw %}

