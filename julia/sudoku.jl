isSolved = false
sudoku =[
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

function Solve()
    for i in 0:8
        for j in 0:8
            if (sudoku[i + 1][j + 1] == 0)
                for v in 1:9
                    if (CheckValid(i, j, v))
                        sudoku[i + 1][j + 1] = v;
                        Solve();
                        if( isSolved )
                            return true;
                        end;
                        sudoku[i + 1][j + 1] = 0;
                    end;
                end;
                return true;
            end;
        end;
    end;
    isSolved = true;
    return true;
end;

function CheckValid(i, j, v)
    for x in 0:8
        if (i == x)
            continue;
        end;
        if (sudoku[x + 1][j + 1] == v)
            return false;
        end;
    end;
    for y in 0:8
        if (j == y)
            continue;
        end;
        if (sudoku[i + 1][y + 1] == v)
            return false;
        end;
    end;

    xBegin = Int.(floor(i / 3)) * 3;
    yBegin = Int.(floor(j / 3)) * 3;

    for x in xBegin:xBegin + 2
        for y in yBegin:yBegin + 2
            if (i == x && j == y)
                continue;
            end;
            if (sudoku[x + 1][y + 1] == v)
                return false;
            end;
        end;
    end;

    return true;
end;

function Display()
    print("+-------+-------+-------+\r\n");
    for i in 1:9
        print("| ");
        for j in 1:9
            if( sudoku[i][j] == 0)
                print("  ");
            else
                print(sudoku[i][j]);
                print(" ");
            end
            if (j % 3 == 0)
                print("| ");
            end
        end;
        if (i % 3 == 0)
            print("\r\n+-------+-------+-------+");
        end
        print("\r\n");
    end;
end;

Display();
Solve();
Display();