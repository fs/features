class Feature < ActiveRecord::Base
  include Pacecar

  belongs_to :user

  validates :name, :presence => true
  validates :est, :presence => true

  acts_as_taggable

  def approve!
    update_attribute :approved, true
  end

  def unapprove!
    update_attribute :approved, false
  end
end
