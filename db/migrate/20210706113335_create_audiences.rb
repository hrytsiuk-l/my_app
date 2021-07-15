class CreateAudiences < ActiveRecord::Migration[5.0]
  def change
    create_table :audiences do |t|
      t.string :name
      t.string :uid
      add_index :audiences, [:name, :uid], unique: true

      t.timestamps
    end
  end
end
