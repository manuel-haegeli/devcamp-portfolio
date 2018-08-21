# frozen_string_literal: true

# Guest user for all not logged in people
class GuestUser < User
  attr_accessor :name, :first_name, :last_name, :email, :id
end