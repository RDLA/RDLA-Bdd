class Admin::AreaController < InheritedResources::Base
  before_filter :authenticate_admin!
  layout "administration"

  def create
    create!{ collection_url }
  end
  def update
    update!{ collection_url }
  end

  private
  def authenticate_admin!
    authenticate_user!
    redirect_to root_path unless current_user.is_a?(User::Admin)
  end
end
