# encoding: utf-8

shared_examples_for 'a greek transliterator' do
  subject { described_class.instance }
  
  it 'transliterates greek characters' do
    input  = "Γερμανία"
    output = "Germania"
    
    subject.transliterate(input).should == output
  end
end
