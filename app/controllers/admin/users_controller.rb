class Admin::UsersController < Admin::AreaController
  before_filter :manage_password, :only => [:create, :update]
  private
  def manage_password
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end
