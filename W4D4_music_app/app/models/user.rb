# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#



class User < ApplicationRecord
  validates :email, :password_digest, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  attr_reader :password
  # after_initialize :ensure_session_token

  has_many :sessions,
    class_name: :Session,
    foreign_key: :user_id

  has_many :bands,
    class_name: :Band,
    foreign_key: :user_id

  has_many :albums,
    class_name: :Album,
    foreign_key: :user_id

  has_many :tracks,
    class_name: :Track,
    foreign_key: :user_id

  has_many :notes,
    class_name: :Note,
    foreign_key: :user_id

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user

    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    new_session = Session.create!(user_id: self.id, token: Session.generate_token)
    new_session.token

    # self.session_token = Session.generate_token
    # self.save!
    # self.session_token
  end

  def is_password?(password)
    bcrypt_object = BCrypt::Password.new(self.password_digest)
    bcrypt_object.is_password?(password)
  end

  def password=(password)
    @password = password # why do I need this?
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    reset_session_token!

    # sessions = Session.find_by(user_id: self.id) # something like this might be useful later
    # self.session_token ||= Session.generate_token
  end

end
