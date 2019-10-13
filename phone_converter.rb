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
		 
		 @word_collection =[]
	     number = number.split("")
	     characters = number.map{|n| @words[n]}
	     char_array = characters.shift.product(*characters).map(&:join)
	     char_word_conv(char_array)
   
             @word_collection = @dictionary_words[0] & @word_collection.flatten
        p @word_collection
    end

    def char_word_conv(char_array)
       @word_collections = []
       i =2
        while i < 7 do
         char_array.uniq.each do |char|
           match_word(char.split(""),i)
           @word_collection << @matches
        end
        
        i += 1
       end
       # p @word_collection
    end

    def match_word(char,i)
    	@matches = []
      j= 0
      while (i+j) <= char.length do
      	@matches <<  char[j..(i+j)].join("").split()
      	# puts matches.class
      	# @word_collection << matches
       j +=1
      end
      # @dictionary_words[0] & @matches.uniq
      # puts @matches.count
      # puts @matches
      # puts @matches.class
       # @word_collection.uniq

    end

end

PhoneConverter.new