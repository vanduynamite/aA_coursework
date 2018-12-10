# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  album_id   :integer          not null
#  user_id    :integer          not null
#  name       :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  track_type :string
#

class Track < ApplicationRecord
  validates :name, :ord, presence: true
  validates :track_type, inclusion: ['Standard', 'Bonus']

  has_one :band,
    through: :album,
    source: :band

  has_many :notes,
    class_name: :Note,
    foreign_key: :track_id

  belongs_to :album,
    class_name: :Album,
    foreign_key: :album_id

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id

end
