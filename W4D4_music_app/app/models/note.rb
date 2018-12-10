# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  track_id   :integer          not null
#  user_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class Note < ApplicationRecord
  validates :body, presence: true

  belongs_to :track,
    class_name: :Track,
    foreign_key: :track_id

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id

end
