# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  has_many :post_subs,
    foreign_key: :post_id,
    class_name: :PostSub,
    dependent: :destroy,
    inverse_of: :post

  has_many :subreddits,
    through: :post_subs,
    source: :subreddit

end
