//= require jquery
//= require underscore-min.js
//= require angular/angular
//= require angular-resource/angular-resource
//= require_self
//= require_tree ./services
//= require_tree ./controllers

var backofficeApp = angular.module('backofficeApp', ['ngResource']);

backofficeApp.config(["$httpProvider", function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content');
}]);
