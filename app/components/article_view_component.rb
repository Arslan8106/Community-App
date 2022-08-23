# frozen_string_literal: true

class ArticleViewComponent < ViewComponent::Base
  attr_reader :article

  def initialize(article:)
    @article = article
  end
end
