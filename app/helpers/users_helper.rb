module UsersHelper
  def profile_img(user, options={size: 100})
    # include MD5 gem, should be part of standard ruby install
    #require 'digest/md5'

    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)

    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto d-block shadow")
  end

end
