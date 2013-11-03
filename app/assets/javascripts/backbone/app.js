//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers

var app = app || {};

$(function() {

  app.router = new app.Router();

  Backbone.history.start();
  Backbone.history.on('route', function() {
    var fragment = Backbone.history.getFragment();
    console.log(fragment);
  })
});