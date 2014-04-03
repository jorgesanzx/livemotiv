class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :profile, index: true
      t.integer :openness
      t.integer :conscientiousness
      t.integer :extraversion
      t.integer :agreeableness
      t.integer :neuroticism

      t.timestamps
    end
  end
end
