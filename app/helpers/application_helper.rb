module ApplicationHelper

  def get_avatar(user, css_class = 'photo')
    if user.avatar.attached?
      avatar = user.avatar.variant(resize: '100x100^', crop: "100x100+0+0")
    else
      avatar = "default-avatar.jpg"
    end
    image_tag avatar, class: css_class
  end

  def get_image(post)
    if post.upload.attached?
      image = post.upload
    else
      image = "base_education.jpg"
    end
    image_tag image, class: 'blog_image'
  end

end
