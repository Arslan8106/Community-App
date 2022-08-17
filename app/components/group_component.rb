# frozen_string_literal: true

class GroupComponent < ViewComponent::Base
    def initialize(group_name:,category: )
        @group_name = group_name
        @group_category = category
      end
end
