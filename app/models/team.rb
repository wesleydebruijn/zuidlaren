class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  has_and_belongs_to_many :events
end
