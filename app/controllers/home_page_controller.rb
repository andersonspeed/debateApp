class HomePageController < ApplicationController
  def index
    if current_user.nil?
      render 'signin'
    end
  end
end
