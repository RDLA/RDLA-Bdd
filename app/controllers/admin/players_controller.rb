#encoding: utf-8
class Admin::PlayersController < Admin::AreaController
  before_filter :find_all_maps, :only =>  [:edit,:create, :new, :update]
  before_filter :find_all_users, :only => [:edit,:create, :new, :update]

private
  def find_all_maps
    @maps = Map.all
  end
  def find_all_users
    @users = User.all
  end
end
