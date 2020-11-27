module UsersHelper
    def gravatar_for(user = "")
        eml = user.email
        hash_value = Digest::MD5::hexdigest(eml.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{hash_value}"
        image_tag(gravatar_url, alt: user.user_name, class: "gravatar")
    end
end
