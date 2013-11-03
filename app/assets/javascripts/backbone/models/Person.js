var app = app || {};

app.Person = Backbone.Model.extend({
  defaults: {
    name: '',
    size: 2000
  },

  urlRoot: '/index'
});