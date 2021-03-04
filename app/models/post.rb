class Post < ApplicationRecord

  belongs_to :user

  enum contrast: [ :simple, :enphasis ]
  enum type_subject: [:post, :video]

end
