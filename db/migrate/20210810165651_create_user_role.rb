class CreateUserRole < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :role_id
      t.string :resource_name
    end
  end
end
