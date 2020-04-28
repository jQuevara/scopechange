module ApplicationHelper
  def current_user
    user_id = session[:user_id] || cookies[:user_id]

    if user_id.present?
      @current_user = User.find(user_id)
    end

    return false unless @current_user

    @current_user
  end

  def current_user_admin?
    current_user && @current_user.role == 1
  end
end
