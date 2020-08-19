class UsersController < ApplicationController
  before_action :set_user, except: :delete
  def show
  end
private
  def set_user
      @user = User.find(params[:id])
  end
end
