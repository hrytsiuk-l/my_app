class CreateAudiences < ActiveRecord::Migration[5.0]
  def change
    create_table :audiences do |t|
      t.string :name, unique: true
      t.string :uid, unique: true
      
      t.timestamps
    end
  end
end
