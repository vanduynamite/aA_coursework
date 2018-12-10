# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :string           not null
#  moderator   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :moderator_person,
    foreign_key: :moderator,
    class_name: :User

  has_many :post_subs,
    foreign_key: :sub_id,
    class_name: :PostSub

  has_many :posts,
    through: :post_subs,
    source: :post

end
