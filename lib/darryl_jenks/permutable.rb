module DarrylJenks
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
    def each_permutation(permutable_key, substitution_value, options = {})
      return unless self.key_string.index(permutable_key)
      
      permutations = []
      split_tokens = self.key_string.split(permutable_key)
      # At least a single permutation needs to be present
      number_of_permutations = [(split_tokens.size - 1), 1].max

      permutations_for(number_of_permutations).each do |permutation_pattern|
        permutation_string = ""
        copied_tokens = split_tokens.map(&:dup)

        permutation_pattern.each do |replace_split_token|
          permutation_string << copied_tokens.shift

          if replace_split_token
            permutation_string << substitution_value
          else
            permutation_string << (options[:non_replace_substitution] || permutable_key)
          end
        end

        permutation_string << copied_tokens.shift unless copied_tokens.empty?
        permutations << permutation_string
      end

      if block_given?
        permutations.each do |permutation|
          yield permutation
        end
      else
        permutations.to_enum
      end
    end

    private

    def permutations_for(size_of_tokens)
      [ true, false ].repeated_permutation(size_of_tokens).to_a
    end

  end
end
