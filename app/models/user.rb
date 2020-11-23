# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :password_confirm

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validates_presence_of :password, on: :create

  def self.signup(new_user)
    if new_user.password != new_user.password_confirm
      new_user.errors.add(:base, :mismatch_password, message: 'Passwords do not match')
    end

    new_user.save if new_user.errors.empty?

    new_user
  end
end
