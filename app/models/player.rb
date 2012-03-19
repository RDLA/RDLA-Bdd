class Player < ActiveRecord::Base

  attr_accessible :name, :posx, :posy, :visual_acuity, :map

  belongs_to :map
  belongs_to :user

  validates :name, :presence => true
  validates :posx, :presence => true, :numericality => true
  validates :posy, :presence => true, :numericality => true
  validates :map, :presence => true
  validates :visual_acuity, :presence => true

end
