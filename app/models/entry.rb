class Entry
  include Mongoid::Document

  field :name, type: String

  belongs_to :game

  embeds_many :groups

  accepts_nested_attributes_for :groups

  validates :name, presence: true
end
