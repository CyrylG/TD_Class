#file: grammar_stats.rb

class GrammarStats
    def initialize
        #initialize a counter for the total number of texts checked
        @total_texts = 0
        #intitalize a counter for the number of good texts
        @good_texts = 0
    end

    def check(text) #string
        #check if the text starts with a capital letter and ends with punctiona mark or not
        result = (text[0] =~ /[A-Z]/) && (text[-1] =~/[.?!]/)
        #convert the result to boolean
        result = !result.nil?
        #increment the total_texts counter
        @total_texts += 1
        #increment the good text counter if  the text passed the check
        @good_texts += 1 if result
        #returns true or false depending on the check result
        result
    end

    def percentage_good
        #if no texts have been checked, return 0 to avoid division by zero 
        return 0 if @total_texts.zero?
        #calculate the percentage of good texts and round the result
        ((@good_texts.to_f / @total_texts) * 100).round
    end
end