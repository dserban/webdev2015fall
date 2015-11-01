'use strict';

var app = angular.module('AngularGeographyApp', []);

app.controller('AngularGeographyController', ['$scope', function($scope) {
  // begin

  $scope.g = window.geoHierarchy;
  $scope.appLevel = 1;
  $scope.appTitle = 'Select a continent';
  $scope.countryIDs = [];
  $scope.cityIDs = [];
  $scope.selectedCityName = '';
  $scope.selectedAdminDivisionName = '';
  $scope.selectedCountryName = '';
  $scope.selectedContinentName = '';
  $scope.selectedPopulation = '';

  function setCountryIDs(continent) {
    $scope.countryIDs = continent['country_ids'];
    $scope.appLevel = 2;
    $scope.appTitle = 'Select a country';
  }
  $scope.setCountryIDs = setCountryIDs;

  function setCityIDs(countryID) {
    $scope.cityIDs = $scope.g['countries'][countryID]['city_ids'];
    $scope.appLevel = 3;
    $scope.appTitle = 'Select a city';
  }
  $scope.setCityIDs = setCityIDs;

  function getCountryName(countryID) {
    return $scope.g['countries'][countryID]['country_name'];
  }
  $scope.getCountryName = getCountryName;

  function getCityName(cityID) {
    return $scope.g['cities'][cityID]['city_name'];
  }
  $scope.getCityName = getCityName;

  function disseminateCityInfo(cityID) {
    var cityObject = $scope.g['cities'][cityID];
    $scope.selectedCityName = cityObject['city_name'];
    $scope.selectedAdminDivisionName = cityObject['admin_division_name'];
    $scope.selectedCountryName = cityObject['country_name'];
    $scope.selectedContinentName = cityObject['continent_name'];
    $scope.selectedPopulation = cityObject['population'];
    $scope.appLevel = 4;
    $scope.appTitle = 'Check out city information below';
  }
  $scope.disseminateCityInfo = disseminateCityInfo;

  // end

  window.sc = $scope;

}]);

