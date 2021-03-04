class Post < ApplicationRecord

  belongs_to :user

  enum contrast: [ false, true ]
  enum type_subject: [:post, :video]

end
