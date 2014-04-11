require "numberstring/numberstring"

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
    when "4"
      I18n.with_locale(:fr) { result = numbertosolve.to_words }
    when "5"
      I18n.with_locale(:de) { result = numbertosolve.to_words }
    end
  	render text:result
  end

  def algorithmethod

    #i declared an array with numbers less than 20
    lessthantenth = %W[one two three four five six seven eight nine ten eleven twelve thirten fourteen fifteen sixteen seventeen eighteen nineteen].unshift(' ')
    #i declared an array for the tenths
    tenths = %W[twenty thirty fourty fifty sixty seventy eighty ninety]

    input = params[:number]
    number = Integer(input)

    a = Numberstring.new
    result = a.convertnumber(number)
    
  	render text:result
  end
end
