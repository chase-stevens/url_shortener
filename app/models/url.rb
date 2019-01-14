class Url < ApplicationRecord
  def to_param
    short
  end
end
