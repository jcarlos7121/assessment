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
    tenths = %W[twenty thirty fourty fifty sixty seventy eighty ninety]

    input = params[:number]
    number = Integer(input)

    result = ""

    if number < 20
      result = lessthantenth[number]
    elsif number > 19 && number < 100
      result = tenths[Integer(number.to_s[0])-2] + " " + lessthantenth[Integer(number.to_s[1])]
    elsif number > 99 && number < 1000
       Integer(number.to_s[1]) == 0 ?  result = lessthantenth[Integer(number.to_s[0])] + " hundred " + " " + lessthantenth[Integer(number.to_s[2])] : result = lessthantenth[Integer(number.to_s[0])] + " hundred " + tenths[Integer(number.to_s[1])-2] + " " + lessthantenth[Integer(number.to_s[2])]
    elsif number > 999 && number < 10000
      if Integer(number.to_s[1]) == 0
        Integer(number.to_s[2]) == 0 ? result = lessthantenth[Integer(number.to_s[0])] + " thousand " +lessthantenth[Integer(number.to_s[3])] : result = lessthantenth[Integer(number.to_s[0])] + " thousand " + " "+  tenths[Integer(number.to_s[2])-2] + " " + lessthantenth[Integer(number.to_s[3])]
      elsif Integer(number.to_s[2]) == 0
        result =  lessthantenth[Integer(number.to_s[0])] + " thousand " + lessthantenth[Integer(number.to_s[1])] + " hundred " +  " " + lessthantenth[Integer(number.to_s[3])]
      else
        result = lessthantenth[Integer(number.to_s[0])] + " thousand " + lessthantenth[Integer(number.to_s[1])] + " hundred " + tenths[Integer(number.to_s[2])-2] + " " + lessthantenth[Integer(number.to_s[3])]
      end
    end
  	render text:result
  end
end
