class PegSolitaire
  PEG_PRESENT = 1
  PEG_MISSING = 0
  PEG_OUTSIDE_BOARD = -1

  INIT_POSITION = [3, 3].freeze
  OUT_OF_BOARD_POSITIONS = [
    [0, 0],
    [0, 1],
    [1, 0],
    [1, 1],
    [0, 5],
    [0, 6],
    [1, 5],
    [1, 6],
    [5, 0],
    [5, 1],
    [5, 5],
    [5, 6],
    [6, 0],
    [6, 1],
    [6, 5],
    [6, 6]
  ].freeze

  def initialize
    @solution_found = false
    @pegs_count = 32
    @pegs_board = build_pegs_board
    @solution = []
    @movements = []
  end

  def call
    backtracking
  end

  private

  def move(i, j, check_i1, check_j1, checki2, checkj2, movement)
    do_move(i, j, check_i1, check_j1, checki2, checkj2, movement)
    backtracking
    undo_move(i, j, check_i1, check_j1, checki2, checkj2)
  end

  def do_move(i, j, check_i1, check_j1, checki2, checkj2, movement)
    @pegs_board[i][j] = PEG_MISSING
    @pegs_board[check_i1][check_j1] = PEG_MISSING
    @pegs_board[checki2][checkj2] = PEG_PRESENT
    @solution[@pegs_count - 1] = [i, j]
    @movements[@pegs_count - 1] = movement
    @pegs_count -= 1
  end

  def undo_move(i, j, check_i1, check_j1, checki2, checkj2)
    @pegs_board[i][j] = PEG_PRESENT
    @pegs_board[check_i1][check_j1] = PEG_PRESENT
    @pegs_board[checki2][checkj2] = PEG_MISSING
    @solution[@pegs_count - 1] = [-1, -1]
    @pegs_count += 1
  end

  def backtracking
    return if @solution_found
    show_solution if @pegs_count == 1

    (0..6).to_a.each do |i|
      (0..6).to_a.each do |j|
        if @pegs_board[i][j] == 1
          if can_move_diagonal_right_down?(i, j)
            move(i, j, i + 1, j + 1, i + 2, j + 2, '↘')
          end

          if can_move_right?(i, j)
            move(i, j, i, j + 1, i, j + 2, '→')
          end

          if can_move_diagonal_left_up?(i, j)
            move(i, j, i - 1, j - 1, i - 2, j - 2, '↖')
          end

          if can_move_up?(i, j)
            move(i, j, i - 1, j, i - 2, j, '↑')
          end

          if can_move_diagonal_right_up?(i, j)
            move(i, j, i - 1, j + 1, i - 2, j + 2, '↗')
          end

          if can_move_down?(i, j)
            move(i, j, i + 1, j, i + 2, j, '↓')
          end

          if can_move_left?(i, j)
            move(i, j, i, j - 1, i, j - 2, '←')
          end

          if can_move_diagonal_left_down?(i, j)
            move(i, j, i + 1, j - 1, i + 2, j - 2, '↙')
          end
        end
      end
    end
  end

  def can_move_diagonal_right_up?(i, j)
    i - 2 > 0 &&
      j + 2 < 7 &&
      @pegs_board[i - 1][j + 1] == PEG_PRESENT &&
      @pegs_board[i - 2][j + 2] == PEG_MISSING
  end

  def can_move_diagonal_left_up?(i, j)
    i - 2 > 0 &&
      j - 2 > 0 &&
      @pegs_board[i - 1][j - 1] == PEG_PRESENT &&
      @pegs_board[i - 2][j - 2] == PEG_MISSING
  end

  def can_move_diagonal_left_down?(i, j)
    i + 2 < 7 &&
      j - 2 > 0 &&
      @pegs_board[i + 1][j - 1] == PEG_PRESENT &&
      @pegs_board[i + 2][j - 2] == PEG_MISSING
  end

  def can_move_diagonal_right_down?(i, j)
    i + 2 < 7 &&
      j + 2 < 7 &&
      @pegs_board[i + 1][j + 1] == PEG_PRESENT &&
      @pegs_board[i + 2][j + 2] == PEG_MISSING
  end

  def can_move_up?(i, j)
    i - 2 > 0 &&
      @pegs_board[i - 1][j] == PEG_PRESENT &&
      @pegs_board[i - 2][j] == PEG_MISSING
  end

  def can_move_right?(i, j)
    j + 2 < 7 &&
      @pegs_board[i][j + 1] == PEG_PRESENT &&
      @pegs_board[i][j + 2] == PEG_MISSING
  end

  def can_move_down?(i, j)
    i + 2 < 7 &&
      @pegs_board[i + 1][j] == PEG_PRESENT &&
      @pegs_board[i + 2][j] == PEG_MISSING
  end

  def can_move_left?(i, j)
    j - 2 > 0 &&
      @pegs_board[i][j - 1] == PEG_PRESENT &&
      @pegs_board[i][j - 2] == PEG_MISSING
  end

  def show_solution
    @solution_found = true
    puts 'Solution found! -->'
    @solution.compact.reverse.each_with_index do |position, index|
      puts "Position: [#{position[0]}, #{position[1]}], Movement: #{@movements.compact.reverse[index]}"
    end
  end

  def build_pegs_board
    pegs_board = [
      build_row,
      build_row,
      build_row,
      build_row,
      build_row,
      build_row,
      build_row
    ]

    OUT_OF_BOARD_POSITIONS.each do |position|
      pegs_board[position[0]][position[1]] = PEG_OUTSIDE_BOARD
    end

    pegs_board[INIT_POSITION[0]][INIT_POSITION[1]] = PEG_MISSING

    pegs_board
  end

  def build_row
    Array.new(7) { PEG_PRESENT }
  end
end
