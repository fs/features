class AddApprovedToFeatures < ActiveRecord::Migration
  def self.up
    add_column :features, :approved, :boolean, :default => false
  end

  def self.down
    remove_column(:features, :approved)
  end
end
