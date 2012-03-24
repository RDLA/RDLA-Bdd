#encoding: utf-8
class Admin::TerraformingsController < Admin::AreaController
  before_filter :get_session, :only => [:index, :create, :create_all, :minimap_js]
  layout false

  def index

    @categories = Field.all.collect{ |f| Category.find(f.category_id) rescue nil}.compact.uniq
    @maps = Map.all
  end
  def create
    Terraforming.where("posx=? AND posy=? AND map_id = ?",params[:posx].to_i, params[:posy].to_i, params[:map].to_i ).destroy_all
    unless(@map.default_field_id == params[:field].to_i)
      t = Terraforming.new
      t.map_id = params[:map].to_i
      t.posx = params[:posx].to_i
      t.posy = params[:posy].to_i
      t.field_id = params[:field].to_i
      t.save
    end
    @fields = @map.get_fields(@posx, @posy, [@width, @height].max )
    render :show_map
  end
  def create_all
    Terraforming.where("posx BETWEEN ? AND ? AND posy BETWEEN ? AND ? AND map_id = ?",params[:posx].to_i,params[:posx].to_i+params[:width].to_i, params[:posy].to_i, params[:posy].to_i+params[:height].to_i, @map.id ).destroy_all
    params[:posy].to_i.upto(params[:posy].to_i+params[:height].to_i) do |y|
      params[:posx].to_i.upto(params[:posx].to_i+params[:width].to_i) do |x|
        unless(@map.default_field_id == params[:field].to_i)
          t = Terraforming.new
          t.map_id = @map.id
          t.posx = x
          t.posy = y
          t.field_id = params[:field].to_i
          t.save
        end
      end
    end
    @fields = @map.get_fields(@posx, @posy, [@width, @height].max )
    render :show_map
  end
  def update_position
    session[:terraforming_map_id] = params[:map_id].to_i
    session[:terraforming_posx] = params[:posx].to_i
    session[:terraforming_posy] = params[:posy].to_i
    session[:terraforming_width] = params[:width].to_i
    session[:terraforming_height] = params[:height].to_i
    get_session
    render :show_map
  end
  def field_css
    @fields = Field.all
    render :layout => false
  end
  def minimap_js
    @minimap_terraformings = @map.terraformings.order("field_id ASC")
    posx = @minimap_terraformings.collect{|t| t.posx}
    posy = @minimap_terraformings.collect{|t| t.posy}
    if posy.blank? || posx.blank?
      @posx_min = 0
      @posx_max = 10
      @minimap_width = 5
      @minimap_height = 5
    else
      @posx_min = posx.min
      @minimap_width = posx.max - posx.min + 1
      @posy_min = posy.min
      @minimap_height = posy.max - posy.min + 1
    end
    
  end

  private
  def get_session
    if session[:terraforming_map_id].blank?
      session[:terraforming_map_id] = 1
      session[:terraforming_posx] = 0
      session[:terraforming_posy] = 0
      session[:terraforming_width] = 10
      session[:terraforming_height] = 10
    end

    @map = Map.find session[:terraforming_map_id].to_i
    @posx = session[:terraforming_posx].to_i
    @posy = session[:terraforming_posy].to_i
    @width = session[:terraforming_width].to_i
    @height = session[:terraforming_height].to_i

    @fields = @map.get_fields(@posx, @posy, [@width, @height].max )
  end
end
