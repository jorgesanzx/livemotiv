class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :email
      t.string :username, index: true
      t.string :name
      t.string :image
      t.string :location
      t.string :gender
      t.integer :age
      t.string :job
      t.string :web
      t.text :summary
      t.text :what_i_look_for
      t.boolean :offer_help?
      t.boolean :receive_help?

      t.timestamps
    end
  end
end
