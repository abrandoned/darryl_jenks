module DarylJenks
  class SubstringFinder
    include ::Enumerable

    attr_accessor :source_string, :permutable_key

    def initialize( permutable_key = nil, source_string = nil )
      self.source_string = source_string
      self.permutable_key = permutable_key
    end

    def each
      results = []

      substring_indexes.each do |substring_index|
        results << self.source_string[substring_index..-1]
      end

      if block_given?
        results.each do |result|
          yield result
        end
      else
        return results.to_enum
      end
    end

    def each_substring(permutable_key)
      self.permutable_key = permutable_key

      if block_given?
        each do |result|
          yield result
        end
      else
        return to_a.to_enum
      end
    end

    def substring_indexes
      start_index = -1
      string_length = self.source_string.length
      substring_indexes = []

      begin
        break if start_index >= string_length # Issues with JRuby Regex engine pre 1.7.6
        substring_indexes << start_index if start_index > -1
      end while (start_index = self.source_string.index(self.permutable_key, start_index + 1))

      return substring_indexes
    end

    def to_a
      self.each.to_a
    end

  end
end
