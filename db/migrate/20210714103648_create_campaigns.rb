class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name, unique: true
      t.string :uid, unique: true
      t.references :audience, foreign_key: true
      
      t.timestamps
    end
  end
end
