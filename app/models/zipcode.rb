class Zipcode
  include Mongoid::Document
  field :name, type: String
  field :children, type: Array, default: []

  has_many :people
  belongs_to :area
end
