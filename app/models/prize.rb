class Prize < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :trade

  validates :bottles, :company, presence: true
end
