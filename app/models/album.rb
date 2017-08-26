# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  band_id        :integer          not null
#  title          :string           not null
#  year           :integer          not null
#  recording_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Album < ApplicationRecord
  validates :band_id, :title, :year, :recording_type, presence: true
  validates :recording_type, inclusion: { in: ["Studio", "Live"]}

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track,
    dependent: :destroy

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
end
