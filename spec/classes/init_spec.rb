require 'spec_helper'
describe 'helloTravelers' do
  context 'with default values for all parameters' do
    it { should contain_class('helloTravelers') }
  end
end
