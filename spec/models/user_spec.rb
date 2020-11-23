# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password).on(:create) }
  end

  describe '.signup' do
    let(:signup_params) do
      { username: 'demo1', password: 'demo1234', password_confirm: 'demo1234', email: 'demo1@example.com' }
    end
    let(:subject) { User.new(signup_params) }

    it 'creates new user' do
      new_user = User.signup(subject)
      expect(new_user.errors).to be_empty
      expect(new_user).to be_persisted
    end

    context 'ensure password is matching' do
      let(:signup_params) do
        { username: 'demo1', password: 'demo1234', password_confirm: 'wrong_match', email: 'demo1@example.com' }
      end

      it 'invalidates' do
        User.signup(subject)
        expect(subject.errors).to_not be_empty
        expect(subject.errors.full_messages_for(:base)).to include('Passwords do not match')
      end
    end

    context 'ensure username is unique' do
      before do
        User.create(signup_params)
      end

      it 'invalidates' do
        User.signup(subject)
        expect(subject.errors).to_not be_empty
        expect(subject.errors.full_messages_for(:username)).to include('Username is currently in use by another user')
      end
    end

    context 'ensure email is unique' do
      before do
        User.create(signup_params)
      end

      it 'invalidates' do
        User.signup(subject)
        expect(subject.errors).to_not be_empty
        expect(subject.errors.full_messages_for(:email)).to include('Email is currently in use by another user')
      end
    end
  end
end
