class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum kind: [:user, :admin, :manager]
  enum status: [:active, :inactive]

  validates :name, presence: true
  validates :username, uniqueness: true

end
