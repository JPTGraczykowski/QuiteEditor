class Api::SessionsController < ApplicationController
  def current
    render json: { signed_in: user_signed_in?, user: current_user }
  end
end
