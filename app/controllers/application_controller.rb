class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	render "index"  	
  end

  def apimethod
    result = ""
    #receive the number
    input = params[:number]
    #safe parsing
    numbertosolve = Integer(input)  
    #solve with the locale
    case params[:language]
    when "1"
      I18n.with_locale(:es) { result = numbertosolve.to_words }
    when "2"
      I18n.with_locale(:en) { result = numbertosolve.to_words }
    when "3"
      I18n.with_locale(:hu) { result = numbertosolve.to_words }
    end
  	render status: 200,text:result
  end

  def algorithmethod
  	render status: 200
  end

end
