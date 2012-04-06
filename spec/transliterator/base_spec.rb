# encoding: utf-8

require 'spec_helper'

describe Transliterator::Base do
  subject { Transliterator::Base.instance }
  
  it_behaves_like 'a base transliterator'
end
