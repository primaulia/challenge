class AddAvailabilityToSectionAndItems < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :available, :boolean, default: true
    add_column :items, :available, :boolean, default: true
  end
end
