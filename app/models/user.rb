class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation(on: :create) do
    self.bottles = 0
  end

  has_many :transactions
  has_many :trades
  belongs_to :company
end
