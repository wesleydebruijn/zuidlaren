class User < ApplicationRecord
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :repositories
  has_many :todos, dependent: :destroy
end
