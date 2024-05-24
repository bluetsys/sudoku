var isSolved = false;
var sudoku = [
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

function Solve() {
    for (let i = 0; i < 9; i++) {
        for (let j = 0; j < 9; j++) {
            if (sudoku[i][j] == 0) {
                for (let v = 1; v <= 9; v++) {
                    if (CheckValid(i, j, v)) {
                        sudoku[i][j] = v;
                        Solve();
                        if (isSolved) {
                          return true;
                        }
                        sudoku[i][j] = 0;
                    }
                }
                return true;
            }
        }
    }
    isSolved = true;
    return true;
}

function CheckValid(i, j, v) {
    for (let x = 0; x < 9; x++) {
        if (i == x) continue;
        if (sudoku[x][j] == v) return false;
    }
    for (let y = 0; y < 9; y++) {
        if (j == y) continue;
        if (sudoku[i][y] == v) return false;
    }
    let xBegin = Math.floor(i / 3) * 3;
    let yBegin = Math.floor(j / 3) * 3;
    for (let x = xBegin; x < xBegin + 3; x++) {
        for (let y = yBegin; y < yBegin + 3; y++) {
            if (i == x && j == y) continue;
            if (sudoku[x][y] == v) return false;
        }
    }
    return true;
}

function Display(arr) {
    let str = '+-------+-------+-------+\n';

    for (let i = 0; i < 9; i++) {
        str += '| ';
        for (let j = 0; j < 9; j++) {
            let v = arr[i][j] == 0 ? ' ' : arr[i][j];
            str += v + ' ';

            if( (j+1) % 3 == 0 ) {
                str += '| ';
            }
        }

        if( (i+1) % 3 == 0 ) {
            str += '\n+-------+-------+-------+';
        }
        str += '\n';
    }
    console.log(str);
}

Display(sudoku);
Solve();
Display(sudoku);