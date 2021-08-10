class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :uid
      t.string :name
      t.string :permission
    end
  end
end
