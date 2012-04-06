# encoding: utf-8

shared_examples_for 'a latin transliterator' do
  subject { described_class.instance }

  it 'transliterates latin characters' do
    input  = 'cuī dōnō lĕpĭdūm nŏvūm lĭbēllŭm'
    output = 'cui dono lepidum novum libellum'
    
    subject.transliterate(input).should == output
  end
end
