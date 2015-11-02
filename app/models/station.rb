class Station < ActiveRecord::Base
  has_many :positions
  belongs_to :company

  validates :company, :name, presence: true
end
