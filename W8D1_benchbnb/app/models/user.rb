# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :sessions,
    class_name: :Session,
    foreign_key: :user_id,
    inverse_of: :user

  attr_reader :password
  # after_initialize :new_session!

  def self.find_by_credentials(username, pw)
    @user = User.find_by(username: username)
    return nil unless @user && @user.is_password?(pw)
    @user
  end

  def reset_session_token!(current_session_token)
    delete_session!(current_session_token)
    new_session!
  end

  def delete_session!(current_session_token)
    session = Session.find_by(session_token: current_session_token)
    session.destroy! if session
  end

  def is_password?(pw)
    password_digest_object = BCrypt::Password.new(self.password_digest)
    password_digest_object.is_password?(pw)
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  private

  def new_session!
    session = Session.create!(session_token: generate_session_token, user_id: self.id)
    session.session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

end
