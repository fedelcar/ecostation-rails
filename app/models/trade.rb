class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :prize

  validates :user, :prize, presence: true
end
