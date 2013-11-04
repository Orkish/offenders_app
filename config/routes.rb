OffenderApp::Application.routes.draw do

  root :to => 'zipcodes#index'

end

#### I don't think we need to create a routes because
#### we are using backbone.js