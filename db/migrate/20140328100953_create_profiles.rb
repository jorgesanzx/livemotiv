class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :email
      t.string :nickname
      t.string :name
      t.string :image
      t.string :location
      t.string :gender

      t.timestamps
    end
  end
end
