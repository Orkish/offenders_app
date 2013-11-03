var app = app || {};

app.Person = Backbone.Model.extend({
  idAttribute: 'slug',
  name: '',
  size: '',

  urlRoot: '/person'
});