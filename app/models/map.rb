class Map < ActiveRecord::Base

  attr_accessible :name, :default_field_id

  belongs_to :default_field, :class_name => 'Field'

  has_many :players, :dependent => :nullify
  has_many :terraformings, :dependent => :destroy

  validates :default_field, :presence => true
  validates :name, :presence => true

end
