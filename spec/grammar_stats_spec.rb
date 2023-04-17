#file: grammar_stats_spec.rb

require 'grammar_stats'

RSpec.describe GrammarStats do
    describe "#check" do
        context 'when text returns with a capital letter and end with sentence-ending puntuation mark' do
            it 'returns true' do
                gs = GrammarStats.new
                text = "Hello, Planet!"
                expect(gs.check(text)).to eq(true)
            end
        end

        context "when text doesn't start with a capital letter or end with sentence-punctuation make" do
            it 'returns false' do
                gs = GrammarStats.new
                text = "hello, planet"
                expect(gs.check(text)).to eq(false)
            end
        end
    end

    describe "#percentage_good" do
        it 'returns the correct percentage of good texts' do
            gs = GrammarStats.new
            good_text = "This is a good Text."
            bad_text = "this is a bad text"

            gs.check(good_text)
            gs.check(bad_text)
            gs.check(good_text) 

            expect(gs.percentage_good).to eq(67)
        end
    end
end