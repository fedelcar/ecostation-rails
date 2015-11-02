class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :prize

  validates :user, :prize, :date, presence: true
end
