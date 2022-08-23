# frozen_string_literal: true

class NewcommentFormComponent < ViewComponent::Base

    attr_reader :form

    def initialize(form:)
      @form = form
    
    end

end
