class Resource < ApplicationRecord
  belongs_to :user
  PUBLIC = ["Enfants", "Adultes"]
  OBJECTIF = ["Apprendre", "Se divertir"]
  ACTIVITIES = ["regarder", "jouer", "écouter", "lire", "fabriquer"]
  STATES = ["pending", "approved", "denied"]

  validates :description, :link, :public, :objectif, :activity_type, presence: true
  validates :public, inclusion: { in: PUBLIC }
  validates :objectif, inclusion: { in: OBJECTIF }
  validates :activity_type, inclusion: { in: ACTIVITIES }
  validates :state, inclusion: { in: STATES }
  validates :link, format: { with: /\b((http|https):\/\/)[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/?))/i, message: "please enter a correct URL" }
end
