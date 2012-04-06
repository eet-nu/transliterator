module Transliterator
  class Text
    attr_reader :string
    
    def initialize(string)
      @string = string
    end
    
    def transliterate(*transliterators)
      transliterators << Latin.instance if transliterators.empty?
      transliterated = string.dup
      transliterators.each do |transliterator|
        transliterated = transliterator.transliterate(transliterated)
      end
      transliterated
    end
  end
end
