class Numberstring
	def convertnumber(number)
	    #i declared an array with numbers less than 20
	    lessthantenth = %W[one two three four five six seven eight nine ten eleven twelve thirten fourteen fifteen sixteen seventeen eighteen nineteen].unshift(' ')
	    #i declared an array for the tenths
	    tenths = %W[twenty thirty fourty fifty sixty seventy eighty ninety]

    	  #if the number is less than 20, i just look inside the array.
	  if number < 20
	      result = lessthantenth[number]
	      #if the number its between 19 and 100 i just find the match inside the tenths and the last number and append it to the result string
	    elsif number > 19 && number < 100
	      result = tenths[Integer(number.to_s[0])-2] + " " + lessthantenth[Integer(number.to_s[1])]
	    
	      #i just make use of the first numbers and append 'hundred', along with the previous matching inside the arrays.
	    elsif number > 99 && number < 1000
	        if Integer(number.to_s[1]) == 0
	          result = lessthantenth[Integer(number.to_s[0])] + " hundred " + " " + lessthantenth[Integer(number.to_s[2])]   
	        else
	          #catch for the "teens", nineteen, seventeen, etc.
	          if Integer(number.to_s[1]) == 1
	           result = lessthantenth[Integer(number.to_s[0])] + " hundred " + lessthantenth[Integer(number.to_s[1]+number.to_s[2])] 
	          #if there are none of them, then i just match the tenths with its last numbers.
	          else
	            result = lessthantenth[Integer(number.to_s[0])] + " hundred " + tenths[Integer(number.to_s[1])-2] + " " + lessthantenth[Integer(number.to_s[2])]            
	          end
	        end
	   #if the number its in between 999 and 10000, then just continue matching
	    elsif number > 999 && number < 10000
	      #1000
	      if Integer(number.to_s[1]) == 0
	        #1001
	        if Integer(number.to_s[2]) == 0
	          result = lessthantenth[Integer(number.to_s[0])] + " thousand " +lessthantenth[Integer(number.to_s[3])] 
	        else
	          #1011
	          if Integer(number.to_s[2]) == 1
	           result = lessthantenth[Integer(number.to_s[0])] + " thousand " +  lessthantenth[Integer("1"+number.to_s[3])]
	            #1020
	          else
	            result = lessthantenth[Integer(number.to_s[0])] + " thousand " + " "+  tenths[Integer(number.to_s[2])-2] + " " + lessthantenth[Integer(number.to_s[3])]
	          end
	        end
	      #1100
	      elsif Integer(number.to_s[2]) == 0
	        result =  lessthantenth[Integer(number.to_s[0])] + " thousand " + lessthantenth[Integer(number.to_s[1])] + " hundred " +  " " + lessthantenth[Integer(number.to_s[3])]
	      else
	        #1110
	        if Integer(number.to_s[2]) == 1
	          result = lessthantenth[Integer(number.to_s[0])] + " thousand " + lessthantenth[Integer(number.to_s[1])] + " hundred " + lessthantenth[Integer("1"+number.to_s[3])]          
	          #1120
	        else
	            result = lessthantenth[Integer(number.to_s[0])] + " thousand " + lessthantenth[Integer(number.to_s[1])] + " hundred " + tenths[Integer(number.to_s[2])-2] + " " + lessthantenth[Integer(number.to_s[3])]          
	        end
	      end
	    end
	end
end