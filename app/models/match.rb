class Match
  include Mongoid::Document

  field :name, type: String

  embedded_in :group

  validates :name, presence: true
end
