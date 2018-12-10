# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  question_id :integer          not null
#  answer      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class AnswerChoice < ApplicationRecord
  validates :answer, presence: true

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Response

  has_one :poll,
    through: :question,
    source: :poll

end
