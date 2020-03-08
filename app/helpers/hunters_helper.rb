# frozen_string_literal: true

# Hunters Helper
module HuntersHelper
  def hunter_select(form)
    tag.div class: 'select' do
      form.collection_select :playbook_id, Hunter.all, :id, :name
    end
  end
end
