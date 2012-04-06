# encoding: utf-8

shared_examples_for 'a base transliterator' do
  subject { described_class.instance }
  
  it 'is a singleton' do
    subject.should be_a Transliterator::Base
    expect { described_class.new }.to raise_error(NoMethodError)
  end
  
  it 'transliterates math related characters' do
    input  = '5 × 10 ÷ 2 ‐ 5 = 20'
    output = '5 x 10 / 2 - 5 = 20'
    
    subject.transliterate(input).should == output
  end
  
  it 'transliterates "smart" quotes' do
    input  = '‛This‘ „is a quote”'
    output = '\'This\' "is a quote"'
    
    subject.transliterate(input).should == output
  end
  
  it 'transliterates non-breaking spaces' do
    input  = "\xc2\xa0"
    output = ' '
    
    subject.transliterate(input).should == output
  end
end
