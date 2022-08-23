# frozen_string_literal: true

class NewGroupFormComponent < ViewComponent::Base
    attr_reader :form

    def initialize(form:, group:)
      @form = form
      @group = group
    end
end
