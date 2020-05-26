# frozen_string_literal: true

class DropPlaybookgears < ActiveRecord::Migration[6.0]
  def change
    drop_table :playbookgears
  end
end
