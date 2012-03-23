class Map < ActiveRecord::Base

  attr_accessible :name, :default_field_id

  belongs_to :default_field, :class_name => 'Field'

  has_many :players, :dependent => :nullify
  has_many :terraformings, :dependent => :destroy

  validates :default_field, :presence => true
  validates :name, :presence => true

  # Internal: Get fields wich center is (centreX,centreY) with a radius of zone
  #
  # Returnings an array of fields in the specified area.
  def get_fields(centreX, centreY, zone = 5)
    # TODO: Get all fields in a specified area of the current map
    @fields = Hash.new
      self.terraformings.where("posx BETWEEN ? and ?
                        AND posy BETWEEN ? and ?",
                        centreX-zone, centreX+zone,
                        centreY-zone, centreY+zone).each do |field|
      @fields["#{field.posx};#{field.posy}"] = field
     end
    @fields
  end
end
