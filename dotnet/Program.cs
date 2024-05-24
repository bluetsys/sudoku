var isSolved = false;
int[,] sudoku ={
  { 0, 0, 0, 0, 0,  9, 8, 0, 0  },
  { 0, 0, 0, 0, 7,  0, 0, 6, 2  },
  { 8, 0, 0, 0, 0,  2, 0, 0, 7  },

  { 0, 0, 7, 8, 0,  0, 4, 0, 0  },
  { 2, 0, 0, 0, 3,  6, 0, 0, 0  },
  { 5, 0, 0, 0, 0,  0, 0, 0, 0  },

  { 0, 0, 0, 0, 0,  0, 0, 5, 0  },
  { 0, 8, 9, 1, 0,  0, 0, 0, 6  },
  { 0, 0, 0, 4, 0,  0, 7, 0, 0  }
};

bool Solve()
{
    for (var i = 0; i < 9; i++)
    {
        for (var j = 0; j < 9; j++)
        {
            if (sudoku[i, j] == 0)
            {
                for (int v = 1; v <= 9; v++)
                {
                    if (CheckValid(i, j, v))
                    {
                        sudoku[i, j] = v;
                        Solve();
                        if (isSolved)
                        {
                            return true;
                        }
                        sudoku[i, j] = 0;
                    }
                }
                return true;
            }
        }
    }
    isSolved = true;
    return true;
}

bool CheckValid(int i, int j, int v)
{
    for (var x = 0; x < 9; x++)
    {
        if (i == x) continue;
        if (sudoku[x, j] == v) return false;
    }
    for (var y = 0; y < 9; y++)
    {
        if (j == y) continue;
        if (sudoku[i, y] == v) return false;
    }
    var xBegin = (int)Math.Floor((double)i / 3) * 3;
    var yBegin = (int)Math.Floor((double)j / 3) * 3;

    for (var x = xBegin; x < xBegin + 3; x++)
    {
        for (var y = yBegin; y < yBegin + 3; y++)
        {
            if (i == x && j == y) continue;
            if (sudoku[x, y] == v) return false;
        }
    }
    return true;
}

void Display(int[,] array)
{
    var str = "+-------+-------+-------+\r\n";

    for (var i = 0; i < 9; i++)
    {
        str += "| ";
        for (var j = 0; j < 9; j++)
        {
            str += array[i, j] == 0 ? "  " : array[i, j].ToString() + " ";

            if ((j + 1) % 3 == 0)
            {
                str += "| ";
            }
        }

        if ((i + 1) % 3 == 0)
        {
            str += "\r\n+-------+-------+-------+";
        }
        str += "\r\n";
    }

    Console.Write(str);
}

Display(sudoku);
Solve();
Display(sudoku);