# encoding: utf-8

require 'spec_helper'

describe Transliterator do
  describe '#asciify' do
    it 'transliterates the given text and strips remaining UTF-8 characters' do
      input  = "cuī dōnō lĕpĭdūm nŏvūm lĭbēllŭm\nSnowman ☃\n5 × 10 ÷ 2 ‐ 5 = 20"
      output = "cui dono lepidum novum libellum\nSnowman \n5 x 10 / 2 - 5 = 20"
      
      Transliterator.asciify(input).should == output
    end
  end
  
  describe '#transliterate' do
    it 'transliterates the given text' do
      input  = "cuī dōnō lĕpĭdūm nŏvūm lĭbēllŭm"
      output = "cui dono lepidum novum libellum"
      
      Transliterator.transliterate(input).should == output
    end
  end
end
