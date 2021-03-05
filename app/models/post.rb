class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :upload
  has_one_attached :thumbnail
  has_rich_text :body
  acts_as_taggable_on :tags

  enum contrast: [ :simple, :enphasis ]
  enum type_subject: [:post, :video]

  scope :listposts, -> { where(type_subject: :post) }
  scope :listvideos, -> { where(type_subject: :video) }

end
