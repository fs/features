class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name
      t.text :feature
      t.text :description
      t.string :source_url
      t.string :demo_url
      t.string :est
      t.integer :user_id

      t.timestamps
    end

    add_index(:features, :user_id)
  end

  def self.down
    drop_table :features
  end
end
