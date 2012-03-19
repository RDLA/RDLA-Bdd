class Category < ActiveRecord::Base
  has_many :fields, :dependent => :nullify

  validates :name, :presence => true, :uniqueness => true
end
