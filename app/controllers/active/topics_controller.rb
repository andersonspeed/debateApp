class Active::TopicsController < ApplicationController
before_action :set_topic
before_action :check_topic_status, except: :update
def update
  @topic.startDebate

  @topic.challenger_id = current_user.id

  redirect_to active_topic_path(@topic)
end

def show
  if @topic.complete
    redirect_to judging_topic_path(@topic)
  end

end

private
def set_topic
  @topic = Topic.find(params[:id])
end

def check_topic_status
  if !@topic.active & !@topic.complete
    redirect_to pending_topic_path(@topic)
  elsif @topic.complete
    redirect_to judging_topic_path(@topic)
  end
end
end
