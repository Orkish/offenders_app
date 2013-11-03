var app = app || {};

app.Zipcodes = Backbone.Collection.extend({
  model: app.Zipcode,
  url: '/index'
});