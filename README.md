# Test Drive a Single-Class Program 
This repository contains two single-class Ruby programs developed using Test-Driven Development (TDD)practice.

### Table of Content
1. Exercise: DiaryEntry
2. Challenge: GrammarStats

## Exercose: DiaryEntry
The 'DiaryEntry' class is desinged to help users create diary entries and perform various operations, such as counting words, 
estimating reading time, and retrieving reading chunks based on reading speed and time available.

### Key Features
- Create a diary entry with a title and contents
- Retrieve the title and contents
- Count the number of words in the contents
- Estimate teh reading time based on words per minute (wpm)
- Retrieve a reading chunk based on wpm and available time

### Files
- 'diary_entry.rb': Implementation of the 'DiaryEntry' class
- 'diary_entry_spec.rb': RSpec tests for the 'DiaryEntry' class

## Challenge: GrammarStats
The 'GrammarStats' class is designed to check the grammar of given texts and provide statistics on the percentag of texts
that pass a basic grammar check.

### Key Features
- Check if a given text starts w ith a capital letter and ends with a sentence-ening punctuation mark
- Calculate the percentage of texts that pass the grammar check

### Files
- 'grammar_stats.rb': Implementation of the 'GrammarStats' class
- 'grammar_stats_spec.rb': RSpec tests for the 'GrammarStats' class

## Running Tests
To run the tests for each class, run the following commands:
rspec diary_entry_spec.rb
rspec grammar_stats_spec.rb

## Contributors:
Chayada Sansiriwong and Cyryl Gotkowicz
