class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :fields, :dependent => :nullify

  validates :name, :presence => true, :uniqueness => true
end
