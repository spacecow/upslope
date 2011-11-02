class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Glossary
  end
end
