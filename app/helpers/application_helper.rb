module ApplicationHelper

  def relation_request_sent?(user)
    current_user.relation_sent.exists?(padawan_id: user.id, status: false)
  end

  def relation_request_received?(user)
    current_user.relation_request.exists?(mentor_id: user.id, status: false)
  end

  def possible_relation?(user)
    request_sent = current_user.relation_sent.exists?(padawan_id: user.id)
    return !request_sent
  end

end
