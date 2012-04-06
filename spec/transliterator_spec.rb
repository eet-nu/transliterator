# encoding: utf-8

require 'spec_helper'

describe Transliterator do
  describe '#transliterate' do
    it 'transliterates the given text' do
      input  = "cuī dōnō lĕpĭdūm nŏvūm lĭbēllŭm"
      output = "cui dono lepidum novum libellum"
      
      Transliterator.transliterate(input).should == output
    end
  end
end
