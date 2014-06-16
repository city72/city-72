//= require jquery
//= require underscore-min.js
//= require angular/angular
//= require angular-resource/angular-resource
//= require ladda-bootstrap/dist/spin
//= require ladda-bootstrap/dist/ladda
//= require ./ui-ladda
//= require bootstrap/dist/js/bootstrap
//= require_self
//= require_tree ./directives
//= require_tree ./services
//= require_tree ./controllers

var backofficeApp = angular.module('backofficeApp', ['ngResource', 'ui.ladda']);

backofficeApp.config(["$httpProvider", function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content');
}]);
