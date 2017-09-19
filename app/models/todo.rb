class Todo < ApplicationRecord
  belongs_to :team
  belongs_to :user, optional: true

  scope :is_completed, -> { where(completed: true) }
end
