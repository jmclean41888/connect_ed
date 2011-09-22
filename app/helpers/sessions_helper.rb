module SessionsHelper
  
  def set_view
  	if params[:view] == "list"
      cookies[:view] = "list"
    end
   
    if params[:view] == "grid"
      cookies[:view] = "grid"
    end
  end
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  def insufficient_admin_status
    redirect_to root_path, :notice => "You do not have sufficient admin status to access this page."
  end
  
  private
  
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def admin_level_1
      if current_user.nil?
        deny_access
      else
        if (current_user.admin_level.to_i < 1)
        insufficient_admin_status
        end
      end
    end
    
    def admin_level_2
      if current_user.nil?
        deny_access
      else
        if (current_user.admin_level.to_i < 2)
        insufficient_admin_status
        end
      end
    end
    
    def admin_level_3
      if current_user.nil?
        deny_access
      else
        if (current_user.admin_level.to_i < 3)
        insufficient_admin_status
        end
      end
    end
  
end
