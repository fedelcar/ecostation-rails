class Station < ActiveRecord::Base
  has_many :positions
  belongs_to :company

  validates :company, :name, presence: true
  validate :asd

  def asd
    if self.positions.count == 0
      errors.add(:positions, "Seleccione al menos una posicion")
    end
  end
end
