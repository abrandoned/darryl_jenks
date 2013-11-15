require 'spec_helper'

describe ::DarrylJenks::Permutable do

  context "#each_permutation" do
    it "send back permutations to 'hello world' with dashes" do
      test = ::DarrylJenks::Permutable.new("hello world")
      test.each_permutation(" ", "-").to_a.should include("hello world", "hello-world")
    end

    it "send back permutations to 'hello world' with dashes" do
      test = ::DarrylJenks::Permutable.new("hello world")
      test.each_permutation(" ", "-", :non_replace_substitution => "R").to_a.should include("helloRworld", "hello-world")
    end

    it "handles trailing permutable keys" do
      test = ::DarrylJenks::Permutable.new("hello ")
      test.each_permutation(" ", "-").to_a.should include("hello ", "hello-")
    end
  end
end
