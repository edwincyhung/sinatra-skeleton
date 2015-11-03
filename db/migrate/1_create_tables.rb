class CreateTables < ActiveRecord::Migration

  def change
     create_table :users do |u|
      u.string :username
      u.string :email
      u.string :password
      u.timestamps
    end

    create_table :restaurants do |t|
      t.string :name
      t.string :street
      t.string :city
      t.timestamps
    end

    create_table :items do |i|
      i.string :name
      i.decimal :price
      i.timestamps
    end

    create_table :reviews do |r|
      r.integer :rating
      r.text :comment
      r.timestamps
    end

  end

end