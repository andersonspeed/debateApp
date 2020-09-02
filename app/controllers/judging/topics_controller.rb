class Judging::TopicsController < ApplicationController
  before_action :set_topic, only: [:show]
  before_action :check_topic_status, except: [:index]

  def show
  end

  def index
    @categories = Category.all
    @topics = Topic.all
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end
  def check_topic_status
    if !@topic.active & !@topic.judging & !@topic.complete
      redirect_to pending_topic_path(@topic)
    elsif @topic.active
      redirect_to active_topic_path(@topic)
    end
  end
end
