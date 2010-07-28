class ChangeSourceUrlInFeatures < ActiveRecord::Migration
  def self.up
    change_column :features, :source_url, :text
  end

  def self.down
    change_column :features, :source_url, :string
  end
end
