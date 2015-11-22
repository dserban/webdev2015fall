(function(angular) {
  'use strict';
var app = angular.module('form-example1', []);

app.controller('myController', ['$scope', '$http', function($scope, $http) {
  $scope.lettersFromTheServer = [];

  $scope.getLettersFromServer = function() {
      $http.get('/api/letters').
        then(function(response) {
          $scope.status = response.status;
          $scope.lettersFromTheServer = response.data;
        }, function(response) {
          $scope.data = response.data || "Request failed";
          $scope.status = response.status;
      });
  };
}]);

app.directive('verifyConstituentLetters', function() {
  return {
    require: 'ngModel',
    link: function(scope, elm, attrs, ctrl) {
      ctrl.$validators.constituentLetters = function(modelValue, viewValue) {
        if (ctrl.$isEmpty(modelValue)) {
          return true;
        }
        var letters = scope.$eval(attrs.verifyConstituentLetters);
        var int_list = _.map(letters, function(l) { return [l, true] });
        var generated_object = _.object(int_list)
        return viewValue[0] in generated_object;
      };
    }
  };
});

})(window.angular);
