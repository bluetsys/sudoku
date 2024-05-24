package main

import (
	"fmt"
	"math"
)

var isSolved bool = false
var sudoku [][]int = [][]int{
	{0, 0, 0, 0, 0, 9, 8, 0, 0},
	{0, 0, 0, 0, 7, 0, 0, 6, 2},
	{8, 0, 0, 0, 0, 2, 0, 0, 7},

	{0, 0, 7, 8, 0, 0, 4, 0, 0},
	{2, 0, 0, 0, 3, 6, 0, 0, 0},
	{5, 0, 0, 0, 0, 0, 0, 0, 0},

	{0, 0, 0, 0, 0, 0, 0, 5, 0},
	{0, 8, 9, 1, 0, 0, 0, 0, 6},
	{0, 0, 0, 4, 0, 0, 7, 0, 0},
}

func Solve() bool {
	for i := 0; i < 9; i++ {
		for j := 0; j < 9; j++ {
			if sudoku[i][j] == 0 {
				for v := 1; v <= 9; v++ {
					if CheckRow(i, j, v) {
						sudoku[i][j] = v
						Solve()
						if isSolved {
							return true
						}
						sudoku[i][j] = 0
					}
				}
				return true
			}
		}
	}
	isSolved = true
	return false
}

func CheckRow(i int, j int, v int) bool {
	for x := 0; x < 9; x++ {
		if i == x {
			continue
		}
		if sudoku[x][j] == v {
			return false
		}
	}
	for y := 0; y < 9; y++ {
		if j == y {
			continue
		}
		if sudoku[i][y] == v {
			return false
		}
	}
	var xBegin float64 = math.Floor(float64(i/3)) * 3
	var yBegin float64 = math.Floor(float64(j/3)) * 3
	for x := int(xBegin); x < int(xBegin+3); x++ {
		for y := int(yBegin); y < int(yBegin+3); y++ {
			if i == x && j == y {
				continue
			}
			if sudoku[x][y] == v {
				return false
			}
		}
	}
	return true
}

func Display(arr [][]int) {
	fmt.Print("+-------+-------+-------+\r\n")
	for i := 0; i < 9; i++ {
		fmt.Print("| ")
		for j := 0; j < 9; j++ {
			if arr[i][j] == 0 {
				fmt.Print("  ")
			} else {
				fmt.Print(arr[i][j], " ")
			}

			if (j+1)%3 == 0 {
				fmt.Print("| ")
			}
		}
		if (i+1)%3 == 0 {
			fmt.Print("\r\n+-------+-------+-------+")
		}
		fmt.Print("\r\n")
	}
}

func main() {
	Display(sudoku)
	Solve()
	Display(sudoku)
}
