class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_num,       default: "",  null: false
      t.integer :prefecture_id,               null: false
      t.string :city,           default: "",  null: false
      t.string :house_num,      default: "",  null: false
      t.string :building,       default: ""
      t.string :phone,          default: "",  null: false
      t.references :buy,                      null: false,  foreign_key: true
      t.timestamps
    end
  end
end
