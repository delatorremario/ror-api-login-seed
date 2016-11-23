class User::PasswordsController < Devise::PasswordsController
  before_action :set_user, only: [:update]
  
  # GET /resource/password/new
   #def new
   #  byebug
   #  super
   #end

  # POST /resource/password
   def create
     #byebug
     @user = User.find_by_email(user_params[:email])
    if @user.present?
      @user.send_password_reset
      render plain: "Email sent with password reset instructions"
    else
        render plain: "no such email"
    end
   end

  # GET /resource/password/edit?reset_password_token=abcdef
   #def edit
   #  @user = User.find_by_password_reset_token!(params[:id])
   #end

  # PUT /resource/password
   def update
         if @user.reset_password_sent_at < 2.hours.ago
          render plain:  "Password reset has expired."
        elsif @user.update_attributes(
                password: params.require(:password),
                password_confirmation: params.require(:password_confirmation)
              )
            render plain:  "Password has been reset!"
        else
            render plain:  "Nones"
        end    
   end

  private
   def set_user
      @user = User.find_by_reset_password_token!(params[:password_token])
   end
   def user_params
      params.permit(:email)
    end
  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
