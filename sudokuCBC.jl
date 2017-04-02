using JuMP
using Cbc

#input = "800000000003600000070090200050007000000045700000100030001000068008500010090000400"
input = ARGS[1]

hints = zeros(Int, 9, 9)
for i = 1:9, j = 1:9
  hints[i, j] = parse(Int, input[(j-1)*9 + i])
end

solution = ""

sudoku = Model(solver = CbcSolver())

  @variable(sudoku, x[i=1:9, j=1:9, k=1:9], Bin)

  for i = 1:9, j = 1:9
    if hints[i,j] != 0
      @constraint(sudoku, x[i, j, hints[i, j]] == 1)
    end
  end

  for i=1:9, j=1:9
    @constraint(sudoku, sum(x[i, j, k] for k=1:9) == 1)
  end

  for i=1:9, k=1:9
    @constraint(sudoku, sum(x[i, j, k] for j=1:9) == 1)
  end

  for j=1:9, k=1:9
    @constraint(sudoku, sum(x[i, j, k] for i=1:9) == 1)
  end

  for i = 1:3:7, j = 1:3:7, k = 1:9
    @constraint(sudoku, sum(x[r, c, k] for  r= i: i+2, c= j: j+2)  == 1)
  end


solve(sudoku)

  values = getvalue(x)

  for i in 1:9, j in 1:9, k in 1:9
      if values[i, j, k] == 1
          solution = string(solution, string(k))
      end
  end

println(solution)
