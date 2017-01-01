class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :zip
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
