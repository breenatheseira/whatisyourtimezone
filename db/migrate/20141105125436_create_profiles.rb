class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :birthdate
      t.string :location
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
