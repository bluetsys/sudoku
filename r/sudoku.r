isSolved <- FALSE;
sudoku <- matrix(data = c(
  0, 0, 0, 0, 0, 9, 8, 0, 0,
  0, 0, 0, 0, 7, 0, 0, 6, 2,
  8, 0, 0, 0, 0, 2, 0, 0, 7,

  0, 0, 7, 8, 0, 0, 4, 0, 0,
  2, 0, 0, 0, 3, 6, 0, 0, 0,
  5, 0, 0, 0, 0, 0, 0, 0, 0,

  0, 0, 0, 0, 0, 0, 0, 5, 0,
  0, 8, 9, 1, 0, 0, 0, 0, 6,
  0, 0, 0, 4, 0, 0, 7, 0, 0
  ), nrow = 9, ncol = 9, byrow = T);

Solve <- function() {
  for (i in 0:8) {
    for (j in 0:8) {
      if (sudoku[i + 1, j + 1] == 0) {
        for (v in 1:9) {
          if (CheckValid(i, j, v)) {
            sudoku[i + 1, j + 1] <<- v;
            Solve();
            if (isSolved) {
              return(T);
            }
            sudoku[i + 1, j + 1] <<- 0;
          }
        }
        return(T);
      }
    }
  }
  isSolved <<- TRUE;
  return(T);
}

CheckValid <- function(i, j, v) {
  for (x in 0:8) {
    if (i == x) next;
    if (sudoku[x + 1, j + 1] == v) return(F);
  }
  for (y in 0:8) {
    if (j == y) next;
    if (sudoku[i + 1, y + 1] == v) return(F);
  }
  xBegin <- floor(i / 3) * 3;
  yBegin <- floor(j / 3) * 3;
  for (x in xBegin:(xBegin + 2)) {
    for (y in yBegin:(yBegin + 2)) {
      if (i == x && j == y) next;
      if (sudoku[x + 1, y + 1] == v) return(F);
    }
  }

  return(T);
}

Display <- function(arr) {
  cat('+-------+-------+-------+\r\n');
  for (i in 1:9) {
    cat('| ');
    for (j in 1:9) {
      if (arr[i, j] == 0) {
        va <- ' ';
      }
      else {
        va <- arr[i, j];
      }
      cat(va, '')
      if (j %% 3 == 0) {
        cat('| ');
      }
    }
    if (i %% 3 == 0) {
      cat('\r\n+-------+-------+-------+');
    }
    cat('\r\n');
  }
}

Display(sudoku);
Solve();
Display(sudoku);