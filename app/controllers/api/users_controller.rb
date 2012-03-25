#encoding: utf-8
class Api::UsersController < Api::AreaController

  def find_by_email
    @user = User.find_by_email(params[:email])
    respond_with @user
  end
end
