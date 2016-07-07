class Dose < ApplicationRecord
  belongs_to :cocktail_id
  belongs_to :ingredient_id

  validates :description, :dose, :ingredient, presence: true
  validates :ingredient uniqueness: { scope: :cocktail }
end
