class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :carrier
      t.string :plan
      t.integer :region
      t.integer :age
      t.float :monthly_premium

      t.timestamps null: false
    end
  end
end
