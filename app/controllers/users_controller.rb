class UsersController < ApplicationController
  before_action :set_user, only: [:update_teacher_status, :show]

  # new, create, edit, update et destroy sont normalement gérés
  # par Devise dans registrations_controller

  def show
  end

  def update_teacher_status
    if teacher_params[:bio] != "" && teacher_params[:bio] != nil
      @user.bio = teacher_params[:bio]
      @user.teacher = !@user.teacher
      if @user.save
        redirect_to @user
      else
        @modal_open = true
        render :show
      end
    else
      @modal_open = true
      render :show
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def teacher_params
    params.require(:user).permit(:bio)
  end

  # def user_params
  #   params.require(:user).permit(:name, :photo, :level, :bio)
  # end
end
