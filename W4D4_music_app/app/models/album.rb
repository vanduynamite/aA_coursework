# == Schema Information
#
# Table name: albums
#
#  id              :bigint(8)        not null, primary key
#  band_id         :integer          not null
#  user_id         :integer          not null
#  name            :string           not null
#  year            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  recording_style :string
#

class Album < ApplicationRecord
  validates :name, presence: true
  validates :recording_style, inclusion: ['Studio', 'Live']
  validate :unique_album_name

  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id

  private

  def unique_album_name
    if Band.find_by(id: band_id).albums.where(name: name).where.not(id: id)
      # # this doesn't work yet
      # errors[:album_name] << "This band already has an album with this name"
    end
  end

end
