class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :title
      t.text :description
      t.text :address
      t.text :service
      t.string :rating

      t.timestamps
    end
  end
end
