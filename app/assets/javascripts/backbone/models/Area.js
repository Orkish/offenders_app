var app = app || {};

app.Area = Backbone.Model.extend({
  defaults: {
    name: ''
  },
  children: new Array(),

  urlRoot: '/index'

});