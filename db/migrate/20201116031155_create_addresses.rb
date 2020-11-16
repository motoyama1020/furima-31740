class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_num,       default: "",  null: false
      t.integer :prefecture_id,               null: false
      t.string :city,           default: ""
      t.string :house_num,      default: ""
      t.string :building,       default: ""
      t.string :phone,          default: ""
      t.references :buy,                     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
