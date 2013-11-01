class Zipcode
  include Mongoid::Document
  field :zip, type: Integer
  field :offender, type: String
  field :location, type: String
end
