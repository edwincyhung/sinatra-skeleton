class CreateTables < ActiveRecord::Migration

  def change
     create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :restaurants do |t|
      t.string :name
      t.string :street
      t.string :city
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.decimal :price      
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.timestamps
    end

  end

end