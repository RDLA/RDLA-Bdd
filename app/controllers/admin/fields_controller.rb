class Admin::FieldsController <  Admin::AreaController
  before_filter :find_all_distant_fields, :only => [:new, :edit, :create, :update]
  before_filter :find_categories
private
  def find_all_distant_fields
    @distant_fields = Field.get_distant_fields_picture
  end
  def find_categories
    @categories = Category.order("name ASC")
  end
end
