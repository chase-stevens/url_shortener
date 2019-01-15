class Url < ApplicationRecord
  # TODO: validation of url
  validates :text, uniqueness: true
  def to_param
    short
  end
end
