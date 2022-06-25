module ApplicationHelper
  def user_avatar(user)
    if user&.avatar?
      user.avatar.url
    else
      asset_path('default_avatar.jpg')
    end
  end
end
