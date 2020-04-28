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
        expect(%w[a b c].my_each { |l| print l, ' -- ' }).to eql(%w[a b c])
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
        expect([0, 1, 1].my_each_with_index { |n, i| puts n + i }).to eql([0, 1, 1])
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

  describe '#my_all?' do
    context 'when none of the elements are false/nil' do
      context 'without block or pattern argument' do
        it 'returns true' do
          expect([].my_all?).to eql(true)
        end
      end

      context 'with block given' do
        it 'returns true' do
          expect(%w[ant bear cat].my_all? { |w| w.length >= 3 }).to eql(true)
        end
      end

      context 'with pattern argument' do
        it 'returns true' do
          expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
        end
      end
    end

    context 'when at least one of the elements are false/nil' do
      context 'without block or pattern argument' do
        it 'returns false' do
          expect([nil, true, 99].my_all?).not_to eql(true)
        end
      end

      context 'with block given' do
        it 'returns false' do
          expect(%w[ant bear cat].my_all? { |w| w.length >= 4 }).not_to eql(true)
        end
      end

      context 'with pattern argument' do
        it 'returns false' do
          expect(%w[ant bear cat].my_all?(/t/)).not_to eql(true)
        end
      end
    end
  end
end