$isSolved = false
$sudoku =[
    [0, 0, 0, 0, 0, 9, 8, 0, 0],
    [0, 0, 0, 0, 7, 0, 0, 6, 2],
    [8, 0, 0, 0, 0, 2, 0, 0, 7],
  
    [0, 0, 7, 8, 0, 0, 4, 0, 0],
    [2, 0, 0, 0, 3, 6, 0, 0, 0],
    [5, 0, 0, 0, 0, 0, 0, 0, 0],
  
    [0, 0, 0, 0, 0, 0, 0, 5, 0],
    [0, 8, 9, 1, 0, 0, 0, 0, 6],
    [0, 0, 0, 4, 0, 0, 7, 0, 0]
  ];

def Solve()
  for i in 0..8
    for j in 0..8
      if $sudoku[i][j] == 0
        for v in 1..9
          if CheckValid(i, j, v)
            $sudoku[i][j] = v
            Solve()
            if $isSolved
              return
            end
            $sudoku[i][j] = 0
          end
        end
        return
      end
    end
  end
  $isSolved = true
end

def CheckValid(i, j, v)
  for x in 0..8
    if i == x
      next
    end
    if $sudoku[x][j] == v
      return false
    end
  end
  for y in 0..8
    if j == y
      next
    end
    if $sudoku[i][y] == v
      return false
    end
  end

  xBegin = i / 3 * 3
  yBegin = j / 3 * 3

  for x in xBegin..xBegin + 2
    for y in yBegin..yBegin + 2
      if i == x && j == y
        next
      end

      if $sudoku[x][y] == v
        return false
      end
    end
  end

  return true

end

def Display(arr)
  print "+-------+-------+-------+\n"
  for i in 0..8
    print "| "
    for j in 0..8
      if arr[i][j] == 0
        print "  "
      elsif
        print arr[i][j], " "
       end

       if (j)% 3 == 2
        print "| "
      end
      
    end

    if (i) % 3 == 2
      print "\n+-------+-------+-------+"
    end
      puts
    end
end

Display($sudoku)
Solve()
Display($sudoku)