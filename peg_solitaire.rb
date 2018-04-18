require "pry"

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

  end

  def call
    pegs_matrix = build_pegs_matrix
    solution = []
    movements = []
    pegs_count = 32
    backtracking(pegs_matrix, solution, pegs_count, movements)
  end

  private

  def backtracking(matrix, solution, pegs_count, movements)
    if pegs_count == 1
      show_solution(solution.compact, movements.compact)
      exit
    end

    (0..6).to_a.each do |i|
      (0..6).to_a.each do |j|
        if matrix[i][j] == 1
          if can_move_diagonal_right_down?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i + 1][j + 1] = PEG_MISSING
            matrix[i + 2][j + 2] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '↘'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i + 1][j + 1] = PEG_PRESENT
            matrix[i + 2][j + 2] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end

          if can_move_right?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i][j + 1] = PEG_MISSING
            matrix[i][j + 2] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '→'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i][j + 1] = PEG_PRESENT
            matrix[i][j + 2] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end

          if can_move_diagonal_left_up?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i - 1][j - 1] = PEG_MISSING
            matrix[i - 2][j - 2] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '↖'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i - 1][j - 1] = PEG_PRESENT
            matrix[i - 2][j - 2] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end

          if can_move_up?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i - 1][j] = PEG_MISSING
            matrix[i - 2][j] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '↑'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i - 1][j] = PEG_PRESENT
            matrix[i - 2][j] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end

          if can_move_diagonal_right_up?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i - 1][j + 1] = PEG_MISSING
            matrix[i - 2][j + 2] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '↗'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i - 1][j] = PEG_PRESENT
            matrix[i - 2][j] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end

          if can_move_down?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i + 1][j] = PEG_MISSING
            matrix[i + 2][j] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '↓'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i + 1][j] = PEG_PRESENT
            matrix[i + 2][j] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end

          if can_move_left?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i][j - 1] = PEG_MISSING
            matrix[i][j - 2] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '←'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i][j - 1] = PEG_PRESENT
            matrix[i][j - 2] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end

          if can_move_diagonal_left_down?(matrix, i, j)
            matrix[i][j] = PEG_MISSING
            matrix[i + 1][j - 1] = PEG_MISSING
            matrix[i + 2][j - 2] = PEG_PRESENT
            solution[pegs_count - 1] = [i, j]
            movements[pegs_count - 1] = '↙'
            pegs_count -= 1
            backtracking(matrix, solution, pegs_count, movements)
            matrix[i][j] = PEG_PRESENT
            matrix[i + 1][j - 1] = PEG_PRESENT
            matrix[i + 2][j - 2] = PEG_MISSING
            solution[pegs_count - 1] = [-1, -1]
            pegs_count += 1
          end
        end
      end
    end
  end

  def can_move_diagonal_right_up?(matrix, i, j)
    i - 2 > 0 &&
      j + 2 < 7 &&
      matrix[i - 1][j + 1] == PEG_PRESENT &&
      matrix[i - 2][j + 2] == PEG_MISSING
  end

  def can_move_diagonal_left_up?(matrix, i, j)
    i - 2 > 0 &&
      j - 2 > 0 &&
      matrix[i - 1][j - 1] == PEG_PRESENT &&
      matrix[i - 2][j - 2] == PEG_MISSING
  end

  def can_move_diagonal_left_down?(matrix, i, j)
    i + 2 < 7 &&
      j - 2 > 0 &&
      matrix[i + 1][j - 1] == PEG_PRESENT &&
      matrix[i + 2][j - 2] == PEG_MISSING
  end

  def can_move_diagonal_right_down?(matrix, i, j)
    i + 2 < 7 &&
      j + 2 < 7 &&
      matrix[i + 1][j + 1] == PEG_PRESENT &&
      matrix[i + 2][j + 2] == PEG_MISSING
  end

  def can_move_up?(matrix, i, j)
    i - 2 > 0 &&
      matrix[i - 1][j] == PEG_PRESENT &&
      matrix[i - 2][j] == PEG_MISSING
  end

  def can_move_right?(matrix, i, j)
    j + 2 < 7 &&
      matrix[i][j + 1] == PEG_PRESENT &&
      matrix[i][j + 2] == PEG_MISSING
  end

  def can_move_down?(matrix, i, j)
    i + 2 < 7 &&
      matrix[i + 1][j] == PEG_PRESENT &&
      matrix[i + 2][j] == PEG_MISSING
  end

  def can_move_left?(matrix, i, j)
    j - 2 > 0 &&
      matrix[i][j - 1] == PEG_PRESENT &&
      matrix[i][j - 2] == PEG_MISSING
  end

  def show_solution(solution, movements)
    puts 'Solution found! -->'
    solution.reverse.each_with_index do |position, index|
      puts "Position: [#{position[0]}, #{position[1]}], Movement: #{movements.reverse[index]}"
    end
  end

  def build_pegs_matrix
    pegs_matrix = [
      build_row,
      build_row,
      build_row,
      build_row,
      build_row,
      build_row,
      build_row
    ]

    OUT_OF_BOARD_POSITIONS.each do |position|
      pegs_matrix[position[0]][position[1]] = PEG_OUTSIDE_BOARD
    end

    pegs_matrix[INIT_POSITION[0]][INIT_POSITION[1]] = PEG_MISSING

    pegs_matrix
  end

  def build_row
    Array.new(7) { PEG_PRESENT }
  end
end

PegSolitaire.new.call
