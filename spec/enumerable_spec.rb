require './enumerable.rb'

describe Enumerable do
  describe '#my_each' do
    context 'without block' do
      it 'returns an Enumerator' do
        expect(%w[a b c].my_each.is_a?(Enumerator)).to eql(true)
      end
    end

    context 'with block given' do
      it 'returns the array itself' do
        expect(%w[a b c].my_each { |x| print x, ' -- ' }).to eql(%w[a b c])
      end
    end
  end
end
