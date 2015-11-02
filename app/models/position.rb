class Position < ActiveRecord::Base
  belongs_to :station
  validates :lat, :lng, :description, presence: true
end
