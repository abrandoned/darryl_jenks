require 'spec_helper'

describe ::DarylJenks::SubstringFinder do
  context "#substring_indexes" do
    it "returns an empty array when no occurrences are present" do
      test = described_class.new( " ", "hello" )
      test.substring_indexes.should eq([])
    end

    it "returns a single entry when word boundary on single word" do
      test = described_class.new( /\b/, "hello" )
      test.substring_indexes.should eq([0])
    end

    it "returns 3 entries when word boundary on 2 words" do
      test = described_class.new( /\b/, "hello world" )
      # "hello world".split(/\b/) => [ "hello", " ", "world" ]
      test.substring_indexes.should eq([0, 5, 6])
    end

    it "returns 2 entries when 'l' in 'hello'" do
      test = described_class.new( 'l', "hello" )
      test.substring_indexes.should eq([2, 3])
    end
  end

  context "#to_a" do
    it "returns the substring splits of word boundaries" do
      test = described_class.new( /\b/, "hello world" )
      test.to_a.should eq(["hello world", " world", "world"])
    end

    it "returns an empty array when no occurrences are present" do
      test = described_class.new( " ", "hello" )
      test.to_a.should eq([])
    end

    it "returns 2 entries when 'l' in 'hello'" do
      test = described_class.new( 'l', "hello" )
      test.to_a.should eq(['llo', 'lo'])
    end
  end
end
