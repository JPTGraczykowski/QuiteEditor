class UsersController < ApplicationController
  def edit; end

  def update
    if params[:password].blank?
      params.delete(:password)
    end

    if current_user.update_with_password(user_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "User's profile has been updated." }
        format.turbo_stream { flash.now[:notice] = "User's profile has been updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :current_password,
    )
  end
end
