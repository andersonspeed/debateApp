class ActiveDebatesController < ApplicationController
  def update
    @topic = Topic.find(params[:id])
    @topic.active = true
    @topic.open = false
    @topic.save
    redirect_to @topic
  end
  private
  def topic_params
    params.require(:topic).permit(:title, :description,:numReplies,:wager,:category_id,:open,:active)
  end
end
