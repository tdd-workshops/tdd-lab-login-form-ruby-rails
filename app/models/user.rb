# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :username, :email
  validates_presence_of :password, on: :create
end
