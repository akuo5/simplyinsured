class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.integer :zip_code
      t.integer :region

      t.timestamps null: false
    end
  end
end
