isSolved = False;
sudoku = [
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

def Solve():
    global isSolved;
    global sudoku;
    for i in range(9):
        for j in range(9):
            if sudoku[i][j] == 0:
                for v in range(1, 10):
                    if CheckValid(i, j, v):
                        sudoku[i][j] = v;
                        Solve();
                        if not isSolved:
                            sudoku[i][j] = 0;
                return;
    isSolved = True;
  
def CheckValid(i, j, v):
    global isSolved;
    global sudoku;
    for x in range(9):
        if i == x: continue;
        if sudoku[x][j] == v: return False;
    for y in range(9):
        if j == y: continue;
        if sudoku[i][y] == v: return False;
    xBegin = (i // 3) * 3;
    yBegin = (j // 3) * 3;
    for x in range(xBegin, xBegin + 3):
        for y in range(yBegin, yBegin + 3):
            if x == i and y == j: continue;
            if sudoku[x][y] == v: return False;
            
    return True;

def Display(arr):
    print("+-------+-------+-------+", end="\n");

    for i in range(9):
        print("| ", end="")
        for j in range(9):
            if arr[i][j] == 0:
                print("", end="  ");
            else:
                print(arr[i][j], end=" ");
            if (j + 1) % 3 == 0:
                print("| ", end="");
        if (i + 1) % 3 == 0:
            print("\n+-------+-------+-------+", end="");
        print("", end="\n");

Display(sudoku);
Solve();
Display(sudoku);