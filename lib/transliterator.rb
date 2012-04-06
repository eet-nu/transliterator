module Transliterator
  autoload :VERSION,  'transliterator/version'
  
  autoload :Base,     'transliterator/base'
  autoload :Cyrillic, 'transliterator/cyrillic'
  autoload :Greek,    'transliterator/greek'
  autoload :Latin,    'transliterator/latin'
  
  autoload :Text,     'transliterator/text'
  
  def self.transliterate(input)
    Text.new(input).transliterate
  end
end
