class Field < ActiveRecord::Base

  attr_accessible :filename, :color

  belongs_to :category
  has_many :terraformings
  has_many :maps

  validates :filename, :presence => true
  validates :color, :presence => true
  validates :category, :presence => true
end
