class Sudoku {

    static Boolean isSolved = false;
    static int[][] sudoku = {
            { 0, 0, 0, 0, 0, 9, 8, 0, 0 },
            { 0, 0, 0, 0, 7, 0, 0, 6, 2 },
            { 8, 0, 0, 0, 0, 2, 0, 0, 7 },

            { 0, 0, 7, 8, 0, 0, 4, 0, 0 },
            { 2, 0, 0, 0, 3, 6, 0, 0, 0 },
            { 5, 0, 0, 0, 0, 0, 0, 0, 0 },

            { 0, 0, 0, 0, 0, 0, 0, 5, 0 },
            { 0, 8, 9, 1, 0, 0, 0, 0, 6 },
            { 0, 0, 0, 4, 0, 0, 7, 0, 0 }
    };

    static Boolean Solve() {
        for (var i = 0; i < 9; i++) {
            for (var j = 0; j < 9; j++) {
                if (sudoku[i][j] == 0) {
                    for (int v = 1; v <= 9; v++) {
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

    static Boolean CheckValid(int i, int j, int v) {
        for (var x = 0; x < 9; x++) {
            if (i == x)
                continue;
            if (sudoku[x][j] == v)
                return false;
        }
        for (var y = 0; y < 9; y++) {
            if (j == y)
                continue;
            if (sudoku[i][y] == v)
                return false;
        }
        var xBegin = (int) Math.floor((double) i / 3) * 3;
        var yBegin = (int) Math.floor((double) j / 3) * 3;

        for (var x = xBegin; x < xBegin + 3; x++) {
            for (var y = yBegin; y < yBegin + 3; y++) {
                if (i == x && j == y)
                    continue;
                if (sudoku[x][y] == v)
                    return false;
            }
        }
        return true;
    }

    static void Display(int[][] array) {
        System.out.print("+-------+-------+-------+\r\n");
        for (int i = 0; i < 9; i++) {
            System.out.print("| ");
            for (int j = 0; j < 9; j++) {
                if (array[i][j] == 0) {
                    System.out.print("  ");
                } else {
                    System.out.print(array[i][j] + " ");
                }

                if ((j + 1) % 3 == 0) {
                    System.out.print("| ");
                }
            }

            if ((i + 1) % 3 == 0) {
                System.out.print("\r\n|-------+-------+-------|");
            }
            System.out.print("\r\n");
        }
    }

    public static void main(String args[]) {
        Display(sudoku);
        Solve();
        Display(sudoku);
    }
}