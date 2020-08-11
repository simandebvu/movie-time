module UsersHelper
  def follow_status_btn(usr)
    if current_user.follows?(usr)
      link_to('Unfollow', unfollow_path(usr), method: :delete, class: 'btn btn-danger')
    elsif current_user == usr
      ''
    else
      link_to('Follow', follow_path(usr.id), method: :post, class: 'btn btn-primary')
    end
  end
end
