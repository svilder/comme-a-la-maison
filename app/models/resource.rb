class Resource < ApplicationRecord
  belongs_to :user

  validates :description, :link, :public, :objectif, :activity_type, presence: true
  validates :public, inclusion: { in: ["kids", "adults"] }
  validates :objectif, inclusion: { in: ["learn", "fun"] }
  validates :activity_type, inclusion: { in: ["watch", "play", "listen", "read", "make"] }
  validates :link, format: { with: /\b((http|https):\/\/)[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/?))/i, message: "please enter a correct URL" }
end
