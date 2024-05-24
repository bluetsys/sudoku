import kotlin.math.*

var isSolved = false
var sudoku = arrayOf(
    arrayOf(0, 0, 0, 0, 0,  9, 8, 0, 0  ),
    arrayOf(0, 0, 0, 0, 7,  0, 0, 6, 2  ),
    arrayOf(8, 0, 0, 0, 0,  2, 0, 0, 7  ),
  
    arrayOf(0, 0, 7, 8, 0,  0, 4, 0, 0  ),
    arrayOf(2, 0, 0, 0, 3,  6, 0, 0, 0  ),
    arrayOf(5, 0, 0, 0, 0,  0, 0, 0, 0  ),
  
    arrayOf(0, 0, 0, 0, 0,  0, 0, 5, 0  ),
    arrayOf(0, 8, 9, 1, 0,  0, 0, 0, 6  ),
    arrayOf(0, 0, 0, 4, 0,  0, 7, 0, 0  )
)

fun Solve() {
    for (i in 0..8) {
        for (j in 0..8) {
            if( sudoku[i][j] == 0 ) {
                for( v in 1..9 )
                {
                    if(CheckValid(i,j,v)) {
                        sudoku[i][j] = v
                        Solve()
                        if(isSolved) {
                            return;
                        }
                        sudoku[i][j] = 0
                    }
                }
                return;
            }
        }
    }
    
    isSolved = true
    return;
}

fun CheckValid(i: Int, j: Int, v: Int): Boolean {
    for (x in 0..8) {
        if( i == x) continue
        if(sudoku[x][j] == v) return false
    }
	for (y in 0..8) {
        if(j == y) continue
        if(sudoku[i][y] == v) return false
    }
    var xBegin = floor((i / 3).toDouble()).toInt() * 3
    var yBegin = floor((j / 3).toDouble()).toInt() * 3
    var xEnd = xBegin + 2;
    var yEnd = yBegin + 2;

    for ( x in xBegin..xEnd ) {
        for ( y in yBegin..yEnd ) {
            if (i == x && j == y) continue
            if (sudoku[x][y] == v) return false;
        }
    }
    return true
}

fun Display(arr: Array<Array<Int>>) {
    print("+-------+-------+-------+\n")
    for (i in 0..8) {
        print("| ")
        for (j in 0..8) {
            if( arr[i][j] == 0)
            {
            	print("  ")
            }
            else
            {
                print(arr[i][j])
                print(" ")
            }
            
            if((j + 1)% 3 == 0)
        	{
                print("| ")
        	}
        }
        
        if((i + 1)% 3 == 0)
        {
            print("\n+-------+-------+-------+")
        }
        
        println()
    }
}

fun main() {
    Display(sudoku)
    Solve()
    Display(sudoku)
}