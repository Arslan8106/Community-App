# frozen_string_literal: true

class CommentViewComponent < ViewComponent::Base
  attr_reader :comment

  def initialize(comment:)
    @comment = comment
  end
end
