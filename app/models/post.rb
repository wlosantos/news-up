class Post < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :upload
  has_one_attached :streaming
  has_rich_text :body
  acts_as_taggable_on :tags

  enum contrast: [ :simple, :enphasis ]
  enum type_subject: [:post, :video]

  scope :listposts, -> { where(type_subject: :post) }
  scope :listvideos, -> { where(type_subject: :video) }
  scope :list_comments_posts, -> { joins(:comments).where(type_subject: :post, comments: {status: :pending}).distinct }
  scope :list_comments_videos, -> { joins(:comments).where(type_subject: :video, comments: {status: :pending}).distinct }

  validates :upload, presence: true

  def total_comments
    self.comments.where(status: :pending).count
  end

  def self.search(search)
    where("title LIKE ?", "%" + search + "%")
  end

end
