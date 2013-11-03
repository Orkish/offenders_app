class City
  include Mongoid::Document
  field :name, type: String
  field :children, type: Array, default: []

  has_many :areas
end
