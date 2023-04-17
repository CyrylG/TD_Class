class DiaryEntry
    def initialize(title, contents) # Initialize method, called when a new DiaryEntry object is created
      @title = title                # Save the title as an instance variable (object's memory)
      @contents = contents          # Save the contents as an instance variable (object's memory)
    end
  
    def title
      @title                        # Returns the title as a string
    end
  
    def contents
      @contents                     # Returns the contents as a string
    end
  
    def count_words
      @contents.split.count         # Splits the contents into words and counts them, then returns the count as an integer
    end
  
    def reading_time(wpm) # wpm is an integer representing the number of words the user can read per minute
      fail "word per minute must be above 0." unless wpm.positive?
      (count_words / wpm.to_f).ceil # Calculate the reading time in minutes and round it up, then return the result as an integer
    end
  
    def reading_chunk(wpm, minutes) # wpm is an integer, minutes is an integer
      words_to_read = wpm * minutes # Calculate how many words the user can read in the given minutes
      words = @contents.split       # Split the contents into words
  
      # Get a chunk of words the user can read in the given time and join them into a string
      chunk = words.shift(words_to_read).join(' ')
      @contents = words.join(' ')    # Update the contents to exclude the chunk that was read
  
      chunk                          # Return the chunk as a string
    end
  end
  