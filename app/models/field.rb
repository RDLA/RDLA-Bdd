class Field < ActiveRecord::Base

  attr_accessible :filename, :color

  belongs_to :category

  validates :filename, :presence => true
  validates :color, :presence => true
  validates :category, :presence => true
end
