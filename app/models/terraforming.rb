class Terraforming < ActiveRecord::Base

  attr_accessible :posx, :posy, :map_id, :field_id

  belongs_to :map
  belongs_to :field

  validates :map, :presence => true
  validates :field, :presence => true
  validates :posx, :presence => true, :numericality => true
  validates :posy, :presence => true, :numericality => true
end
