module ProfilesHelper
  def gravatar_for user
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    gravatar_url = "https://secure.gravatar.com/#{gravatar_id}"
    image_tag(gravatar_url, alt: 'Gravatar Image', class: 'primary_pic')
  end
end
