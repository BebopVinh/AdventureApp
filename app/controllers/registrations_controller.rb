require 'pry'
class RegistrationsController < Devise::RegistrationsController


    def dashboard
        binding.pry
        @user
    end

private

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :abilities, :catchphrase)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :abilities, :catchphrase)
    end
end