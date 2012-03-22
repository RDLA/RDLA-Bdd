class Admin::MapsController < Admin::AreaController
  before_filter :find_all_fields, :only => [:new, :edit, :update, :create]

  private
  def find_all_fields
    @fields = Field.all
  end
end
