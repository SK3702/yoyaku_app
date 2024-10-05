class ProfileController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.valid?(:profile) && @user.update(user_params)
      redirect_to profile_path(current_user.id)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :intro, :avatar)
    end
end

