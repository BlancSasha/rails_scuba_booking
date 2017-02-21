class UsersController < ApplicationController
  before_action :set_user, only: [:edit_teacher_status]

  # new, create, edit, update et destroy sont normalement gérés
  # par Devise dans registrations_controller

  def edit_teacher_status
    @user.teacher = !@user.teacher
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :photo, :level, :bio)
  end
end
