class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    #se asiga a @uses, el usuario que encuentra realizando el método
    #find_for_facebook_oauth, los parámetros son todos los datos enviados por
    #facebook request.env["omniauth.auth"] 
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    #Si todo lo que tiene el usuario es correcto, realiza un sign in
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else  
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end
end