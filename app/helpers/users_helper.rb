module UsersHelper
  def gravatar_for(user, options = { size: 80, link: false })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
    if options[:link]
      link_to(image_tag(gravatar_url, alt: user.name, class: "gravatar"), user_path(user))
    else
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
  end
end
