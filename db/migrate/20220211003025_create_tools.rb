class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :owner_id
      t.integer :borrower_id
      t.integer :category_id

      t.timestamps
    end
  end
end
