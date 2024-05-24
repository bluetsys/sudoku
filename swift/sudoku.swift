var isSolved: Bool = false;
var sudoku: [[Int]] = [
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

func Solve(){
    for i in 0..<9 {
        for j in 0..<9 {
            if( sudoku[i][j] == 0 ) {
                for v in 1...9 {
                    if( CheckValid(i: i, j: j, v: v) ) {
                        sudoku[i][j] = v;
                        Solve();
                        if(isSolved)
                        {
                            return;
                        }
                        sudoku[i][j] = 0;
                    }
                }
                return;
            }
        }
    }

    isSolved = true;
}

func CheckValid(i :Int, j :Int, v :Int) -> Bool {
    for x in 0..<9 {
        if( i == x) { continue; }
        if( sudoku[x][j] == v) { return false; }
    }
    for y in 0..<9 {
        if( j == y) { continue }
        if( sudoku[i][y] == v) { return false; }
    }

    let _xBegin = i / 3 * 3;
    let _yBegin = j / 3 * 3;

    for x in _xBegin..<_xBegin + 3 {
        for y in _yBegin..<_yBegin + 3 {
            if (i == x && j == y) { continue; }
            if (sudoku[x][y] == v) { return false; }
        }
    }

    return true
}

func Display(arrs: [[Int]] ) {
    print("+-------+-------+-------+\r\n", terminator: "");
    for i in 0..<9 {
        print("| ", terminator: "");
        for j in 0..<9 {
            if( arrs[i][j] == 0 )
            {
                print("  ", terminator: "");
            }
            else {
                print("\(arrs[i][j]) ", terminator: "")  ;  
            }
            
            if (j + 1) % 3 == 0 {
                print("| ", terminator: "");
            }
        }

        if (i + 1) % 3 == 0 {
            print("\r\n+-------+-------+-------+", terminator: "");
        }
        print("\r\n", terminator: "");
    }
}

Display(arrs: sudoku);
Solve();
Display(arrs: sudoku);