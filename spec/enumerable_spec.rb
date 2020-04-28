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
        expect(%w[a b c].my_each { |e| print e, ' -- ' }).to eql(%w[a b c])
      end
    end
  end

  describe '#my_each_with_index' do
    context 'without block' do
      it 'returns an Enumerator' do
        expect([0, 1, 1].my_each_with_index.is_a?(Enumerator)).to eql(true)
      end
    end

    context 'with block given' do
      it 'returns the array itself' do
        expect([0, 1, 1].my_each_with_index { |e, i| puts e + i }).to eql([0, 1, 1])
      end
    end
  end

  describe '#my_select' do
    context 'without block' do
      it 'returns an Enumerator' do
        expect([1, 2, 3, 4].my_select.is_a?(Enumerator)).to eql(true)
      end
    end

    context 'with block given' do
      it 'returns array of elements for which given block returns true' do
        expect([1, 2, 3, 4].my_select(&:even?)).to eql([2, 4])
      end
    end
  end
end
