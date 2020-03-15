# frozen_string_literal: true

# Hunters Helper
module HuntersHelper
  def hunter_select(form)
    tag.div class: 'select' do
      form.collection_select :hunter_id, Hunter.all, :id, :name
    end
  end

  def hunter_link(hunter)
    link_to hunter.name, hunter
  end
end
