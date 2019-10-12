class PhoneConverter
    
    def initialize
      check_dictionary
    end

	# code to check if the given word exists in dictionary
	def check_dictionary
	  @file =[]
	  puts "enter any word"
	  word = gets.chomp
	  word.downcase
	  puts "word is #{word}"
	  File.read("dictionary.txt").split("\n").map{|word| @file << word.downcase }
	 
	  if @file.include?(word)
	    puts "following word #{word} exists in dictionary"
	   else
	   puts	"following word #{word} does not exist in dictionary"
	   end
	end

end

PhoneConverter.new