## Sudoku Solver in Julia
This Julia script solves Sudoku puzzles using JuMP to create a model of 9x9x9 cube and CBC to find a feasible solution that satisfies Sudoku puzzle constraints: rows, columns and blocks.

The script expects an 81 character string as the input for the hints capturing the Sudoku puzzle's rows (empty cells should be 0s) and it outputs an 81 character string of the solution.

## Usage
1. Download the jl file.
2. Run the script in command-line.
```
julia sudokuCBC.jl "800000000003600000070090200050007000000045700000100030001000068008500010090000400"
```
