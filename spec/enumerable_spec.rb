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
    context 'when none of the elements return false/nil' do
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

    context 'when at least one of the elements return false/nil' do
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

  describe '#my_any?' do
    context 'when at least one of the elements return true' do
      context 'without block or pattern argument' do
        it 'returns true' do
          expect([nil, true, 99].my_any?).to eql(true)
        end
      end

      context 'with block given' do
        it 'returns true' do
          expect(%w[ant bear cat].my_any? { |w| w.length >= 4 }).to eql(true)
        end
      end

      context 'with pattern argument' do
        it 'returns true' do
          expect([nil, true, 99].my_any?(Integer)).to eql(true)
        end
      end
    end

    context 'when none of the elements return true' do
      context 'without block or pattern argument' do
        it 'returns false' do
          expect([].my_any?).not_to eql(true)
        end
      end

      context 'with block given' do
        it 'returns false' do
          expect(%w[ant bear cat].my_all? { |w| w.length >= 5 }).not_to eql(true)
        end
      end

      context 'with pattern argument' do
        it 'returns false' do
          expect(%w[ant bear cat].my_any?(/d/)).not_to eql(true)
        end
      end
    end
  end

  describe '#my_none?' do
    context 'when none of the elements return true' do
      context 'without block or pattern argument' do
        it 'returns true' do
          expect([].my_none?).to eql(true)
        end
      end

      context 'with block given' do
        it 'returns true' do
          expect(%w[ant bear cat].my_none? { |w| w.length == 5 }).to eql(true)
        end
      end

      context 'with pattern argument' do
        it 'returns true' do
          expect(%w[ant bear cat].my_none?(/d/)).to eql(true)
        end
      end
    end

    context 'when at least one of the elements return true' do
      context 'without block or pattern argument' do
        it 'returns false' do
          expect([nil, false, true].my_none?).not_to eql(true)
        end
      end

      context 'with block given' do
        it 'returns false' do
          expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).not_to eql(true)
        end
      end

      context 'with pattern argument' do
        it 'returns false' do
          expect([1, 3.14, 42].my_none?(Float)).not_to eql(true)
        end
      end
    end
  end

  describe '#my_count' do
    context 'without block or argument given' do
      it 'counts the number of elements in the array' do
        expect([1, 2, 4, 2].my_count).to eql(4)
      end
    end

    context 'with block given' do
      it 'counts the number of elements yielding a true value' do
        expect([1, 2, 4, 2].my_count(&:even?)).to eql(3)
      end
    end

    context 'with argument given' do
      it 'counts the number of elements equal to the argument' do
        expect([1, 2, 4, 2].my_count(2)).to eql(2)
      end
    end
  end
end
