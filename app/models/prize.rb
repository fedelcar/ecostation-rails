class Prize < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :trade

  validates :bottles, :company, :name, :description, presence: true
  validates :bottles, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
