class Zipcode
  include Mongoid::Document
  field :name, type: String
  field :children, type: Array, default: []
  field :slug, type: String

  has_many :people
  belongs_to :area
end
