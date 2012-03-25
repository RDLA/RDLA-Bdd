class Player < ActiveRecord::Base

  attr_accessible :name, :posx, :posy, :visual_acuity,  :user_id, :map_id, :description, :created_at, :updated_at

  belongs_to :map
  delegate :name, :to => :map, :prefix => true
  belongs_to :user
  delegate :email, :to => :user, :prefix => true


  validates :name, :presence => true
  validates :posx, :presence => true, :numericality => true
  validates :posy, :presence => true, :numericality => true
  validates :map, :presence => true
  validates :visual_acuity, :presence => true

end
