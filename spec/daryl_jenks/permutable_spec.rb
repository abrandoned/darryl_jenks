require 'spec_helper'

describe ::DarylJenks::Permutable do

  context "#each_permutation" do
    it "send back permutations to 'hello world' with dashes" do
      test = ::DarylJenks::Permutable.new("hello world")
      test.each_permutation(" ", "-").to_a.should include("hello world", "hello-world")
    end

    it "send back permutations to 'hello world' with dashes" do
      test = ::DarylJenks::Permutable.new("hello world")
      test.each_permutation(" ", "-", :non_replace_substitution => "R").to_a.should include("helloRworld", "hello-world")
    end
  end
end
