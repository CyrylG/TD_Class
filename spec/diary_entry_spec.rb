#file: diary_entry_spec.rb
require "diary_entry"

RSpec.describe DiaryEntry do
  it "Returns the title as a string" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq("my_title")
    expect(diary_entry.contents).to eq("my_contents")
  end

  describe "#count_words" do
    context "Returns the contents as a string" do
      it "return words count" do
        diary_entry = DiaryEntry.new("my_title", "one")
        expect(diary_entry.count_words).to eq(1)
      end

      it "return 0" do
        diary_entry = DiaryEntry.new("my_title", "")
        expect(diary_entry.count_words).to eq(0)
      end
    end
  end

  describe "#reading_time" do
    context "given a wpm of sensible numbers(200)" do
      it "calculate how long it takes to read by round it up" do
        diary_entry = DiaryEntry.new("my_title", "one " * 550)
        expect(diary_entry.reading_time(200)).to eq(3)
      end
    end

    context "given a wpm of 0" do
      it "fails" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect { diary_entry.reading_time(0) }.to raise_error "word per minute must be above 0."
      end
    end
  end

  describe "#reading_chunk" do
    context "when the content are readable within the time" do
      it "Return the chunk as a string" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect(diary_entry.reading_chunk(200, 1)).to eq("one two three")
      end
    end

    context "when the contents are not readable within the time" do
      it "return a readable chunk" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect(diary_entry.reading_chunk(2, 1)).to eq("one two")
      end
    end

    context "when reading_chunk is called a second time" do
      it "return second chunk" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        expect(diary_entry.reading_chunk(2, 1)).to eq("three")
      end
    end

    context "when all chunks are called, restart from beginning" do
      it "return first chunk" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        expect(diary_entry.reading_chunk(2, 1)).to eq "one two"
      end
    end
  end
end
