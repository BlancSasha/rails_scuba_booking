class Guide::DivesController < ApplicationController
  before_action :confirm_guide_authentification

  def index
    # Let's anticipate on next week (with login)
    @dives = current_user.dives
  end

  def new
    @dive = Dive.new
  end

  def create
    @dive = Dive.new(dive_params)
    if @dive.save
      redirect_to dive_path(@dive)
    else
      render :new
    end
  end

  def edit
    @dive = Dive.find(params[:id])
  end

  def update
    @dive = Dive.find(params[:id])
    if @dive.update(dive_params)
      redirect_to dive_path(@dive)
    else
      render :edit
    end
  end

  def destroy
    @dive = Dive.find(params[:id])
    # redirect_to profile_dives_path
    ## Rediriger vers la index de Dives namespacé dans #profile
  end


  protected

  def dive_params
    params
      .require(:dive)
      .permit(
        :location,
        :capacity,
        :price,
        :depth_required,
        :description,
        photos: []
      )
  end

  def confirm_guide_authentification
    if current_user == nil || current_user.teacher == false
      redirect_to root_path, alert: "You don't have access to this part of the app"
    end
  end
end
