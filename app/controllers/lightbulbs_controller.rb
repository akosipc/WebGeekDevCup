class LightbulbsController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@lightbulbs = Lightbulb.all
  	@owned_lightbulb = Lightbulb.find(:all, :conditions => ["user_id = (?)", current_user.id])
  end	

  def new
  	@lightbulb = Lightbulb.new
  end

  def create
  	@lightbulb = Lightbulb.new(params[:lightbulb])
  	@lightbulb.user_id = current_user.id
    @lightbulb.user_ids = [current_user.id]
  	if @lightbulb.save
  		redirect_to lightbulbs_path, :notice => "An idea was added!"
  	else
  		render 'new'
  	end
  end

  def edit 
  	@lightbulb = Lightbulb.find_by_id(params[:id])
  end

  def update
  	@lightbulb = Lightbulb.find_by_id(params[:id])
  	if @lightbulb.update_attributes(params[:lightbulb])
  		redirect_to lightbulbs_path, :notice => "An idea was updated!"
  	else
  		render 'edit'
  	end
  end

  def show
    @lightbulb = Lightbulb.find_by_id(params[:id])
  end

  def destroy
  	@lightbulb = Lightbulb.find(params[:id])
  	@lightbulb.destroy

 		redirect_to lightbulbs_path, :alert => "An idea was deleted!"
  end

  def volunteer 
    puts params[:id]
    @lightbulb = Lightbulb.find_by_id(params[:id])
    user_ids = @lightbulb.user_ids
    user_ids << current_user.id
    @lightbulb.user_ids = user_ids
    if @lightbulb.save
      redirect_to lightbulb_path(@lightbulb.id), :notice => "You followed this idea!"
    else
      redirect_to lightbulb_path(@lightbulb.id), :alert => "Error in connection!"
    end
  end
end