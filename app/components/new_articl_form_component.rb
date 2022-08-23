# frozen_string_literal: true

class NewArticlFormComponent < ViewComponent::Base
    attr_reader :form

    def initialize(form:, article:)
      @form = form
      @article = article
    end

  
end
