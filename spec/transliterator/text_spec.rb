require 'spec_helper'

describe Transliterator::Text do
  let(:string) { "String" }
  
  subject { Transliterator::Text.new(string) }
  
  describe '#transliterate' do
    it 'translates with the given transliterator' do
      reverser = stub
      reverser.should_receive(:transliterate)
              .with(string)
      
      subject.transliterate(reverser)
    end
    
    it 'returns the transliterated string' do
      reverser = mock(transliterate: 'gnirtS')
      
      subject.transliterate(reverser).should == "gnirtS"
    end
    
    it 'transliterates with Transliterator::Latin if no transliterator is given' do
      Transliterator::Latin.instance
                           .should_receive(:transliterate)
                           .with(string)
      
      subject.transliterate
    end
    
    it 'can apply multiple transliterators' do
      reverser    = Object.new.tap do |instance|
                     def instance.transliterate(string)
                        string.reverse
                      end
                    end
      capitalizer = Object.new.tap do |instance|
                      def instance.transliterate(string)
                        string.capitalize
                      end
                    end
      
      subject.transliterate(reverser, capitalizer).should == 'Gnirts'
    end
  end
end
