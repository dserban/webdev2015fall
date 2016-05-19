'use strict';

var app = angular.module('AngularTrafficLightApp', []);

app.controller('AngularTrafficLightController', ['$scope', function($scope) {
  // begin

  $scope.trafficLightState = 'dark';

  function setTrafficLightStateTo(color) {
    $scope.trafficLightState = color;
  }
  $scope.setTrafficLightStateTo = setTrafficLightStateTo;

  // end

  window.sc = $scope;

}]);

