class DiaryEntry
  def initialize(title, contents) # Initialize method, called when a new DiaryEntry object is created
    @title = title                # Save the title as an instance variable (object's memory)
    @contents = contents
    @current_position = 0          # Save the contents as an instance variable (object's memory)
  end

  def title
    @title                        # Returns the title as a string
  end

  def contents
    @contents                     # Returns the contents as a string
  end

  def count_words
    @contents.split.size         # Splits the contents into words and counts them, then returns the count as an integer
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the user can read per minute
    fail "word per minute must be above 0." unless wpm.positive?
    (count_words / wpm.to_f).ceil # Calculate the reading time in minutes and round it up, then return the result as an integer
  end

  def reading_chunk(wpm, minutes) # wpm is an integer, minutes is an integer
    words_to_read = wpm * minutes # Calculate how many words the user can read in the given minutes
    words = @contents.split       # Split the contents into words

    # Get a chunk of words the user can read in the given time and join them into a string
    start_position = @current_position    # Update the contents to exclude the chunk that was read
    end_position = start_position + words_to_read - 1
    end_position = [end_position, words.size - 1].min

    @current_position = end_position + 1
    @current_position = 0 if @current_position >= words.size
    words[start_position..end_position].join(" ")
    # Return the chunk as a string
  end
end
