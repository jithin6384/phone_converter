class PhoneConverter
    
    def initialize
      #check_dictionary
      input_number
    end

	# code to check if the given word exists in dictionary
	def check_dictionary
	  @file =[]
	  puts "enter any word"
	  word = gets.chomp
	  word =word.downcase
	  puts "word is #{word}"
	  File.read("dictionary.txt").split("\n").map{|word| @file << word.downcase }
	 
	  if @file.include?(word)
	    puts "following word #{word} exists in dictionary"
	   else
	   puts	"following word #{word} does not exist in dictionary"
	   end
	end
   
   #method to input phone number
	def input_number
      puts "Please enter your phone number. It should not have 1 or 0"
      number = gets.chomp
      phone_validity(number)
    

	end

	#method to check validity
	def phone_validity(number)
     unless (number.length == 10 && number.match(/^[2-9]+$/))
      puts "Entered phone number is not valid '\n' please try again"
      input_number
     else
      puts "phone number is valid"
    end
	end

end

PhoneConverter.new