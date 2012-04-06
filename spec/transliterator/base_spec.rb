# encoding: utf-8

require 'spec_helper'

describe Transliterator::Base do
  subject { Transliterator::Base.instance }
  
  describe '.instance' do
    it 'returns a singleton' do
      subject.should be_an_instance_of Transliterator::Base
    end
  end
  
  describe '#initialize' do
    it 'can not be called directly' do
      expect { Transliterator::Base.new }.to raise_error(NoMethodError)
    end
  end
  
  describe '#approximations' do
    it 'returns the approximations' do
      approximations = subject.instance_variable_get(:@approximations)
      subject.approximations.should == approximations
    end
  end
  
  describe '#[]' do
    it 'returns the approximation for the given codepoint' do
      subject[215].should == 120
    end
    
    it 'returns the codepoint if an approximation is not found' do
      subject[97].should == 97
    end
  end
  
  describe '#transliterate' do
    it 'transliterates math related characters' do
      subject.transliterate("5 × 10 ÷ 2 ‐ 5 = 20").should == '5 x 10 / 2 - 5 = 20'
    end
    
    it 'transliterates "smart" quotes' do
      subject.transliterate('‛This‘ „is a quote”').should == '\'This\' "is a quote"'
    end
    
    it 'transliterates non-breaking spaces' do
      subject.transliterate("\xc2\xa0").should == ' '
    end
  end
end
