class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :email
      t.string :password_digest
<<<<<<< HEAD
      add_index :users, [:name, :uid, :email], unique: true
=======
      add_index :users, [:name, :email], unique: true
>>>>>>> fixed typos
      
      t.timestamps
    end
  end
end
