class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.has_role? :admin
      can :manage, :all
      can :approve_feature, Feature
    elsif user.has_role? :user
      can [:create, :read], Feature
      can [:update, :destroy], Feature, {:approved => false, :user_id => user.id}
    else
      can :read, Feature
    end
  end
end