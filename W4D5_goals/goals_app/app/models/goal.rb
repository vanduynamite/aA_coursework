# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  title      :string           not null
#  complete   :boolean          default(FALSE), not null
#  private    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  validates :title, presence: true

end
