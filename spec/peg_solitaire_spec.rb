require_relative '../peg_solitaire'

describe PegSolitaire do
  SOLUTION = <<~TEXT
    Solution found! -->
    Position: [1, 3], Movement: ↓
    Position: [2, 1], Movement: →
    Position: [0, 2], Movement: ↓
    Position: [0, 4], Movement: ←
    Position: [2, 3], Movement: ←
    Position: [2, 0], Movement: →
    Position: [2, 5], Movement: ←
    Position: [2, 2], Movement: →
    Position: [3, 5], Movement: ↖
    Position: [0, 2], Movement: ↘
    Position: [3, 3], Movement: →
    Position: [1, 4], Movement: ↓
    Position: [3, 1], Movement: →
    Position: [3, 4], Movement: ←
    Position: [3, 6], Movement: ←
    Position: [4, 0], Movement: ↑
    Position: [4, 1], Movement: ↗
    Position: [4, 3], Movement: ↗
    Position: [2, 6], Movement: ←
    Position: [4, 5], Movement: ←
    Position: [5, 3], Movement: ↖
    Position: [2, 0], Movement: ↘
    Position: [5, 2], Movement: ↑
    Position: [3, 2], Movement: ↗
    Position: [1, 4], Movement: ↓
    Position: [6, 4], Movement: ↑
    Position: [3, 4], Movement: ↓
    Position: [6, 2], Movement: →
    Position: [6, 4], Movement: ↑
    Position: [4, 3], Movement: →
    Position: [4, 6], Movement: ←
  TEXT

  it 'finds the solution' do
    expect { PegSolitaire.new.call }.to output(SOLUTION).to_stdout
  end
end
