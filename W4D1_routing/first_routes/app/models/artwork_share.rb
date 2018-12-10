# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  viewer_id  :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id,
    message: 'Viewer can only view an artwork once.'}
    
  belongs_to :viewer,
    class_name: :User,
    foreign_key: :viewer_id

  belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artwork_id

end
