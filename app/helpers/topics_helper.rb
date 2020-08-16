module TopicsHelper
  def canJudge(user, topic)
    return !(topic.owner == user or topic.challenger == user)
  end
end
