class LightbulbsController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@lightbulbs = Lightbulb.all
  	@owned_lightbulb = Lightbulb.find_by_user_id(current_user.id)
  end

  def new
  	@lightbulb = Lightbulb.new
  end

  def create
  	@lightbulb = Lightbulb.new(params[:lightbulb])
  	@lightbulb.user_id = current_user.id
  	if @lightbulb.save
  		redirect_to lightbulbs_path, :notice => "An idea was added!"
  	else
  		render 'new'
  	end
  end

  def update
  	@lightbulb = Lightbulb.update_attributes(params[:lightbulb])
  	if @lightbulb.save
  		redirect_to lightbulbs_path, :notice => "An idea was updated!"
  	else
  		render 'edit'
  	end
  end
end