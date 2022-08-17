# frozen_string_literal: true

class CommentsComponent < ViewComponent::Base
  def initialize(user_name:, body:)
    @user_name = user_name
    @body = body
  end

end
