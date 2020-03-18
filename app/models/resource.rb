class Resource < ApplicationRecord
  belongs_to :user
  STATES = ["pending", "approved", "denied"]

  validates :description, :link, presence: true
  validates :state, inclusion: { in: STATES }
  validates :link, format: { with: /\b((http|https):\/\/)[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/?))/i, message: "please enter a correct URL" }
  # to do : validation to have at least one of the the two "public" kids or adults as true. Same for Activity Type and Objectif

  scope :approved, -> { where(state: "approved") }
end
