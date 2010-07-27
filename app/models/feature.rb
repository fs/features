class Feature < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence => true
  validates :est, :presence => true
end
