# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  album_id     :integer          not null
#  title        :string           not null
#  ord          :integer          not null
#  lyrics       :text
#  reg_or_bonus :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :ord, :reg_or_bonus, presence: true
  validates :reg_or_bonus, inclusion: { in: ["Regular", "Bonus"]}

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_many :notes,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Note

end
