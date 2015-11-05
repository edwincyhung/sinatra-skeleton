class AddForeignKeys < ActiveRecord::Migration

  def change
     
    change_table :items do |t|
      t.references :restaurant
    end

    change_table :reviews do |t|
      t.references :item
      t.references :user
    end

  end

end