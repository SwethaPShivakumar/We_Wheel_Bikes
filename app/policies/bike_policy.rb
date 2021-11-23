class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
    # If current user id == @bike.user_id --> true
    # else --> false
  end

  def destroy?
    record.user == user
    # If current user id == @bike.user_id --> true
    # else --> false
  end
end
