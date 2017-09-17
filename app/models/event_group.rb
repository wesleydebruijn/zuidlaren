class EventGroup < ApplicationRecord
  has_many :events, dependent: :destroy
end
