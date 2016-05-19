'use strict';

var app = angular.module('AngularTrafficLightApp', []);

app.controller('AngularTrafficLightController', ['$scope', function($scope) {
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

  // end

  window.sc = $scope;

}]);

