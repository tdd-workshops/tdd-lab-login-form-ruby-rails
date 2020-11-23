# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :password_confirm

  validates_presence_of :username, :email
  validates_presence_of :password, on: :create

  def self.signup(new_user)
    if new_user.password != new_user.password_confirm
      new_user.errors.add(:base, :mismatch_password, message: 'Passwords do not match')
    end

    if User.where(username: new_user.username).count > 0
      new_user.errors.add(:username, :invalid, message: 'is currently in use by another user')
    end

    if User.where(email: new_user.email).count > 0
      new_user.errors.add(:email, :invalid, message: 'is currently in use by another user')
    end

    new_user.save if new_user.errors.empty?

    new_user
  end
end
