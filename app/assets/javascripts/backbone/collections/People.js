var app = app || {};

app.People = Backbone.Collection.extend({
  
  model: app.Person,
  url: '/index'
});