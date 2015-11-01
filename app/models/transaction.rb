class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :station

  validates :user,:station, presence: true
  after_create :update_user_bottle_count

  def update_user_bottle_count
    user = User.find(self.user)
    user.bottles += self.bottles
    user.save
  end

end
