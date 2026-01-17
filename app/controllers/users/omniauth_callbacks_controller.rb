class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
          render json: {
          success: true,
          user: @user,
          message: "Login realizado com sucesso"
        }, status: :ok
      else
          render json: {
          success: false,
          errors: @user.errors.full_messages
        }, status: :unprocessable_entity
      end
  end

  def failure
      render json: {
        success: false,
        error: "Falha na autenticação",
        message: params[:message] || "Erro desconhecido"
      }, status: :unauthorized
  end

  def destroy
    sign_out(current_user)
    render json: { success: true, message: "Logout realizado com sucesso" }, status: :ok
  end
end
