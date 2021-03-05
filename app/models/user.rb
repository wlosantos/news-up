class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments
  has_one_attached :avatar

  enum kind: [:user, :admin, :manager]
  enum status: [:active, :inactive]

  validates :name, presence: true
  validates :username, uniqueness: true

  before_save do
    self.username = username.downcase.split(' ').join()
  end

end
