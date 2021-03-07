class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_voter

  has_many :posts, dependent: :destroy
  has_many :comments
  has_one_attached :avatar
  has_many :friends

  enum kind: [:user, :admin, :manager]
  enum status: [:active, :inactive]
  enum language: ['pt-BR','es','en']

  validates :name, presence: true
  validates :username, uniqueness: true

  before_save do
    self.username = username.downcase.split(' ').join()
  end

  def total_comments
    self.posts.joins(:comments).count
  end

  def request_friends?(friend)
    self.friends.where(friend: friend).exists?
  end

  def status_friends(friend)
    if request_friends?(friend)
      self.friends.where(friend: friend).pluck(:status).join()
    else
      false
    end
  end

end
