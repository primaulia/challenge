class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :identifier
      t.string :label
      t.string :description
      t.float :price
      t.integer :item_type

      t.timestamps
    end
  end
end
