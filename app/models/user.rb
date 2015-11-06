class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # to do: que sea el default en la db
  before_validation(on: :create) do
    self.bottles = 0
    if !self.current.site_admin && self.site_admin
      errors.add("No puede crear un usuario administrador de sitio sin serlo")
    end
    self.title = "#{self.first_name} #{self.last_name}"
  end

  scope :own, -> { where("company_id=?", self.current.company_id) unless self.current.site_admin }

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

  has_many :transactions
  has_many :trades
  belongs_to :company

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_uniqueness_of :rfid, allow_blank: true
end
