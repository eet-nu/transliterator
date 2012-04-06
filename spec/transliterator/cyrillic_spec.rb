# encoding: utf-8

require 'spec_helper'

describe Transliterator::Cyrillic do
  it_behaves_like 'a base transliterator'
  it_behaves_like 'a cyrillic transliterator'
end
