class PhoneConverter
    
    def initialize
      check_dictionary
      input_number
    end

	# code to check if the given word exists in dictionary
	def check_dictionary
	  @dictionary_words =[]
	  
	  @dictionary_words = File.read("dictionary.txt").split("\n").map{|word| @dictionary_words << word.downcase }
	 
	
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
      get_character(number)
     end
	end

	#assnging words to number as per given situation

	def get_character(number)
      @words = {
      "2" => ['a','b','c'],
      "3" => ['d','e','f'],
      "4" => ['g','h','i'],
      "5" => ['j','k','l'],
      "6" => ['m','n','o'],
      "7" => ['p','q','r','s'],
      "8" => ['t','u','v'],
      "9" => ['w','x','y','z']
    }
     character_number_conv(number)
	end

	def character_number_conv(number)
	 word_collection = []
     number = number.split("")
     characters = number.map{|n| @words[n]}
     key_words = characters.shift.product(*characters).map(&:join)
       matches = @dictionary_words[0] & key_words
     word_collection << matches
     puts word_collection.flatten(1)
  end

end

PhoneConverter.new