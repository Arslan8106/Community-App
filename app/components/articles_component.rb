# frozen_string_literal: true

class ArticlesComponent < ViewComponent::Base
  def initialize(title:, description:)
    @title = title
    @description = description
  end

end
