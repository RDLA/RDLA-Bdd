#encoding: utf-8
class Api::PlayersController < Api::AreaController
  belongs_to :user, :optional => true
end
