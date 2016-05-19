'use strict';

var app = angular.module('AngularTrafficLightApp', []);

app.controller('AngularTrafficLightController', ['$scope', '$interval', function($scope, $interval) {
  // begin

  $scope.transitions = {
    'dark' : 'red',
    'red'  : 'green',
    'green': 'amber',
    'amber': 'red'
  };
  $scope.trafficLightState = 'dark';

  function advance() {
    $scope.trafficLightState = $scope.transitions[$scope.trafficLightState];
  }
  $scope.advance = advance;

  $interval(advance, 1000);

  // end

  window.sc = $scope;

}]);

