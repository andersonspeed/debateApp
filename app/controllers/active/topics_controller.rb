class Active::TopicsController < ApplicationController
before_action :set_topic
def update

  @topic.startDebate

  @topic.challenger_id = current_user.id

  redirect_to active_topic_path(@topic)
end

def show

end

private
def set_topic
  @topic = Topic.find(params[:id])
end
end
