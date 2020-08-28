class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      if current_user.senior?
        redirect_to buttons_path
      else
        redirect_to dashboard_path
      end

    end

    # Bottom one works but why doesn't the top one?
    # current_user.senior? ? redirect_to buttons_path : redirect_to dashboard_path
    # redirect_to buttons_path if user_signed_in? && current_user.senior?
  end
end
