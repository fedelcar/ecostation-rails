class Voucher < ActiveRecord::Base
  belongs_to :user

  validates :user, :created_at, :code, presence: true
  validates :consumed, :inclusion => {:in => [true, false]}
  validates :bottles, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :total, numericality: { only_integer: false, greater_than: 0 }
end
