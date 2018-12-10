# == Schema Information
#
# Table name: bands
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :tracks,
    through: :albums,
    source: :tracks

  has_many :albums,
    class_name: :Album,
    foreign_key: :band_id

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id

end
