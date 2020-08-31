class UsersController < ApplicationController
  before_action :set_user, except: :delete
  def show
  end

  def show_open_topics
  end

  def show_completed_topics
  end

  def show_judgments
  end

private
  def set_user
      @user = User.find(params[:id])
  end
end
