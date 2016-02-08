class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.admin
      can :manage, :all
    else
      can :read, :all
      can :create, Vendor do |vendor|
        (user.vendor_id == nil) && user.id
      end
      can :update, Vendor do |vendor|
        vendor.try(:user) == user 
      end
    end
  end
end