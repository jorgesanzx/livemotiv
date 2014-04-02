class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :young, index: true
      t.references :experienced, index: true
      t.integer :affinity

      t.timestamps
    end
  end
end
