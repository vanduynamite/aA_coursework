# == Schema Information
#
# Table name: polls
#
#  id         :bigint(8)        not null, primary key
#  author_id  :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Poll < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :questions,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Question

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses

end
