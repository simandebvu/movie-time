module ApplicationHelper
    def toastr_flash_messages
        flash.each_with_object([]) do |(type, message), flash_messages|
          type = 'success' if type == 'notice'
          type = 'error' if type == 'alert'
          text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
          flash_messages << text.html_safe if message
        end.join("\n").html_safe
    end

    def login_status_btns
      if user_signed_in?
        (link_to current_user.username, edit_user_registration_path, class: "ml-auto nav-link text-white") << (link_to "Logout", destroy_user_session_path, method: :delete, class: "nav-link text-white")
      else 
        (link_to 'Sign Up', new_user_registration_path, class: "ml-auto nav-link text-white") << (link_to 'Sign In', new_user_session_path, class: "nav-link text-white")
      end
    end

end
