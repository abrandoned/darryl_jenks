require "daryl_jenks/version"

module DarylJenks
  class Permutable
    attr_accessor :key_string

    ##
    # Constructor can be initialized with the key_string to initialize off of
    #
    def initialize( key_string = nil )
      self.key_string = key_string
    end
    
    ##
    # Computes the Permutations of a string
    #
    # Ex: key_string = "HELLO WORLD FIRST"
    #
    # each_permutation(" ", "-") 
    # dash_permutations = [ "HELLO-WORLD FIRST", "HELLO-WORLD-FIRST", "HELLO WORLD-FIRST" ]
    #
    # The 'permutable_key' is the character/regex that should be used as the split mechanism
    # to determine how many objects are in the collection to be "permed"
    #
    # The 'substitution_value' is the character that should be used in the permutations of 
    # the string as the separator value
    #
    def each_permutation(permutable_key, substitution_value)
      return unless self.key_string.index

      each_dasherized_permutation(key_string) do |dasherized_permutation|
        self.match_trie.push(dasherized_permutation, value)
      end
    end
  end

  ##
  # Pushes onto the trie any permutation of the keystring that can be dasherized
  #
  # Ex: key_string = "HELLO WORLDS FIRST S"
  #
  # apostrophe permutations = [ "HELLO WORLD'S FIRST S", "HELLO WORLDS FIRST'S", "HELLO WORLD'S FIRST'S" ]
  #

end
