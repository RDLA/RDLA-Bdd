class Field < ActiveRecord::Base

  attr_accessible :filename, :color, :category_id

  belongs_to :category
  delegate :name, :to => :category, :prefix => true
  has_many :terraformings
  has_many :maps

  validates :filename, :presence => true
  validates :color, :presence => true
  validates :category, :presence => true

  # Internal: Get all field available in a distant location. The
  # location is defined in ASSETS_URL in initializer/url.rb
  #
  # Returns an array containing all filenames available in the location
  # but not inserted yet in the database
  require 'open-uri'
  def self.get_distant_fields_picture
    list = open("#{ASSETS_URL}list.php")
    distant_fields = []
    list.each do |line|
      distant_fields << (line.delete "\n")
    end
    list.close
    local_fields = Field.all.collect {|f| f.filename}
    distant_fields - local_fields
  end
end
