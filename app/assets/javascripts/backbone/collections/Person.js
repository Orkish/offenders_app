var app = app || {};

app.Person = Backbone.Collection.extend({
  
  model: app.Person,
  url: '/person'
});