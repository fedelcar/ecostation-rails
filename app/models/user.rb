class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  # to do: que sea el default en la db
  before_validation(on: :create) do
    self.bottles = 0
  end

  has_many :transactions
  has_many :trades
  belongs_to :company

  validates :email, presence: true
  validates :rfid, :email, uniqueness: true
end
