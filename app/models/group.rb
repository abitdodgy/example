class Group
  include Mongoid::Document

  field :name, type: String

  embedded_in :entry

  embeds_many :matches

  accepts_nested_attributes_for :matches

  validates :name, presence: true
end
