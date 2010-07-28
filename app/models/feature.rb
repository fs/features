class Feature < ActiveRecord::Base
  include Pacecar

  belongs_to :user

  validates :name, :presence => true
  validates :est, :presence => true
end
