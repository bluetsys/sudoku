import scala.math._
import scala.util.boundary, boundary.break

object SudokuGame
{
var isSolved = false;
var sudoku: Array[Array[Int]] = Array(
  Array(0, 0, 0, 0, 0, 9, 8, 0, 0),
  Array(0, 0, 0, 0, 7, 0, 0, 6, 2),
  Array(8, 0, 0, 0, 0, 2, 0, 0, 7),
  Array(0, 0, 7, 8, 0, 0, 4, 0, 0),
  Array(2, 0, 0, 0, 3, 6, 0, 0, 0),
  Array(5, 0, 0, 0, 0, 0, 0, 0, 0),
  Array(0, 0, 0, 0, 0, 0, 0, 5, 0),
  Array(0, 8, 9, 1, 0, 0, 0, 0, 6),
  Array(0, 0, 0, 4, 0, 0, 7, 0, 0)
);

def Solve(): Boolean = {
boundary:
  for (i <- 0 to 8) {
    for (j <- 0 to 8) {
      if (sudoku(i)(j) == 0) {
        for (v <- 1 to 9) {
          if (CheckValid(i, j, v)) {
            sudoku(i)(j) = v
            Solve()
            if (isSolved) {
              break(true);
            }
            sudoku(i)(j) = 0
          }
        }
        break(true);
      }
    }
  }

  isSolved = true;
  return true;
}

def CheckValid(i: Int, j: Int, v: Int): Boolean = {
  boundary:
    for (x <- 0 to 8) {
      if (i != x) {
        if (sudoku(x)(j) == v) break(false);
      }
    }
    for (y <- 0 to 8) {
      if (j != y) {
        if (sudoku(i)(y) == v) break(false);
      }
    }

    val xBegin = floor(i / 3).toInt * 3
    val yBegin = floor(j / 3).toInt * 3
    var xEnd = xBegin + 2
    var yEnd = yBegin + 2

    for (x <- xBegin to xEnd) {
      for (y <- yBegin to yEnd) {
        if (i != x && j != y) {
          if (sudoku(x)(y) == v) break(false);
        }
      }
    }
    return true;
}

def Display(arr: Array[Array[Int]]): Unit = {
  print("+-------+-------+-------+\n")
  for (i <- 0 to 8) {
    print("| ")
    for (j <- 0 to 8) {
      if (arr(i)(j) == 0) {
        print("  ")
      } else {
        print(arr(i)(j))
        print(" ")
      }

      if ((j + 1) % 3 == 0) {
        print("| ")
      }
    }

    if ((i + 1) % 3 == 0) {
      print("\n+-------+-------+-------+")
    }
    println()
  }
}

  def main(args: Array[String]) =
  {
    Display(sudoku);
    Solve();
    Display(sudoku);
  }
}