# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  # validations

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  it { should validate_length_of(:password).is_at_least(6) }

  # associations


  # public methods

  describe "#password=" do
    let(:user) { create :user }
    it "assigns password" do
      expect(user.password).to eq("starwars")
    end

    it "assigns password_digest" do
      expect(user.password_digest).to_not be_nil
    end
  end

  describe "::find_by_credentials" do
    let(:user) { create :user }

    it "finds a user given username and password" do
      found_user = User.find_by_credentials(user.username, user.password)
      expect(found_user).to eq(user)
    end

    it "returns nil if no matching user" do
      found_user = User.find_by_credentials('chuckie', "starwars12")
      expect(found_user).to be_nil
    end

  end

  describe "#is_password?" do
    let(:user) { create :user }

    it "returns true if password matches" do
      expect(user.is_password?("starwars")).to be true
    end

    it "returns false if password is incorrect" do
      expect(user.is_password?("montypython")).to be false
    end

  end

  describe "#reset_session_token!" do
    let(:user) { create :user }

    it "resets session token!" do
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end

  end


end
