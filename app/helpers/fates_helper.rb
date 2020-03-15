# frozen_string_literal: true

module FatesHelper
  def tag_select(form:, field:)
    tag.div class: 'select' do
      form.select(
        field,
        collection_for(field: field),
        multiple: true
      )
    end
  end

  def collection_for(field:)
    case field
    when :found_out_list
      Fate::FOUND_OUT
    end
  end

  def fate_buttons(fate)
    tag.div class: 'buttons has-addons' do
      concat link_to 'Show', fate, class: 'button is-small'
      concat link_to 'Edit', edit_fate_path(fate), class: 'button is-small'
      concat link_to 'Destroy',
                     fate,
                     method: :delete,
                     data: { confirm: 'Are you sure?' },
                     class: 'button is-small'
    end
  end
end
