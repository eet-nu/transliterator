# encoding: utf-8

require 'singleton'

module Transliterator
  class Base
    include Singleton
    
    APPROXIMATIONS = {
      "×" => "x",
      "÷" => "/",
      "‐" => "-",
      "‑" => "-",
      "‒" => "-",
      "–" => "-",
      "—" => "-",
      "―" => "-",
      "―" => "-",
      "‘" => "'",
      "‛" => "'",
      "“" => '"',
      "”" => '"',
      "„" => '"',
      "‟" => '"',
      '’' => "'",
      # various kinds of space characters
      "\xc2\xa0"     => " ",
      "\xe2\x80\x80" => " ",
      "\xe2\x80\x81" => " ",
      "\xe2\x80\x82" => " ",
      "\xe2\x80\x83" => " ",
      "\xe2\x80\x84" => " ",
      "\xe2\x80\x85" => " ",
      "\xe2\x80\x86" => " ",
      "\xe2\x80\x87" => " ",
      "\xe2\x80\x88" => " ",
      "\xe2\x80\x89" => " ",
      "\xe2\x80\x8a" => " ",
      "\xe2\x81\x9f" => " ",
      "\xe3\x80\x80" => " ",
    }.freeze
    
    attr_reader :approximations
    
    # Initializes a new +Transliterator::Base+ instance.
    #
    # Because +Transliterator::Base+ is a singleton, you can only get an
    # instance of it by calling the +#instance+ class method on it:
    #
    #     Transliterator::Base.new      # => NoMethodError: private method `new' called for Transliterator::Base:Class
    #     Transliterator::Base.instance # => #<Transliterator::Base:0x007f9b8c086e78> 
    #
    # @return [Transliterator::Base] The +Transliterator::Base+ instance
    def initialize
      @approximations = {}
      APPROXIMATIONS.inject(@approximations) do |memo, object|
        index       = object[0].unpack("U").shift
        value       = object[1].unpack("C*")
        memo[index] = value.length == 1 ? value[0] : value
        memo
      end
    end
    
    # Transliterate a given string's UTF-8 characters to their ASCII equivalants.
    #
    #     transliterator = Transliterator::Base.instance
    #     transliterator.transliterate "5 × 10 ÷ 2 ‐ 5 = 20" # => "5 x 10 / 2 - 5 = 20"
    #
    # @return [String] The transliterated string
    def transliterate(string)
      string.unpack("U*")
            .map { |codepoint| approximations[codepoint] || codepoint }
            .flatten
            .pack("U*")
    end
  end
end
