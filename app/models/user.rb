# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :password_confirm

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validate :matching_password_confirmation, on: :signup

  validates_presence_of :password, on: :create

  def self.signup(new_user)
    new_user.valid?(:signup)
    new_user.save if new_user.errors.empty?

    new_user
  end

  private

  def matching_password_confirmation
    if password_confirm && password != password_confirm
      errors.add(:base, :mismatch_password, message: 'Passwords do not match')
    end
  end
end
