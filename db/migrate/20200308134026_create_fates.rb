class CreateFates < ActiveRecord::Migration[6.0]
  def change
    create_table :fates do |t|
      t.references :hunter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
