//= require jquery
//= require jquery_ujs
//= require underscore-min.js
//= require jquery.matchHeight-min.js
//= require angular/angular
//= require angular-resource/angular-resource
//= require ladda-bootstrap/dist/spin
//= require ladda-bootstrap/dist/ladda
//= require ./ui-ladda
//= require bootstrap/dist/js/bootstrap
//= require danialfarid-angular-file-upload/dist/angular-file-upload-html5-shim
//= require danialfarid-angular-file-upload/dist/angular-file-upload-shim
//= require danialfarid-angular-file-upload/dist/angular-file-upload
//= require_self
//= require_tree ./directives
//= require_tree ./services
//= require_tree ./controllers

var backofficeApp = angular.module('backofficeApp', ['ngResource', 'ui.ladda', 'angularFileUpload']);

backofficeApp.config(["$httpProvider", function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content');
}]);
