# encoding: utf-8

shared_examples_for 'a cyrillic transliterator' do
  subject { described_class.instance }
  
  it 'transliterates cyrillic characters' do
    input  = "Славься, Отечество наше свободное"
    output = "Slavsya, Otechestvo nashe svobodnoe"
    
    subject.transliterate(input).should == output
  end
end
