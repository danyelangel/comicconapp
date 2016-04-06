class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_admin!, only: [:admin]
  
  before_action :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def home
    @user = User.new
  end

  def press
    @articles = Article.order('date DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def guests

  end

  def admin
    redirect_to articles_path
  end

  def contact_us
    user = User.new(user_params)
    subject = params['subject']

    if user.valid?
      user.save
      UserMailer.contact_us(user, subject).deliver_now
      flash[:success] = "¡Se ha enviado exitosamente tu mensaje!"  
    else
      flash[:error] = "Ocurrio un error en el envío del formulario"
    end

    redirect_to "/#contactenos"
  end

  def user_params
    params.require(:user).permit(:name, :email, :company, :phone, :comment)
  end
end
