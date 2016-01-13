require 'spec_helper'

describe Generapp do
  it 'has a version number' do
    expect(Generapp::VERSION).not_to be nil
  end
  it 'has a ruby version number' do
    expect(Generapp::RUBY_VERSION).not_to be nil
  end
  it 'has a rails version number' do
    expect(Generapp::RAILS_VERSION).not_to be nil
  end
end
