#include <iostream>
#include <string>
#include <cmath>

bool isSolved = false;
int sudoku[9][9] = {
    {0, 0, 0, 0, 0, 9, 8, 0, 0},
    {0, 0, 0, 0, 7, 0, 0, 6, 2},
    {8, 0, 0, 0, 0, 2, 0, 0, 7},

    {0, 0, 7, 8, 0, 0, 4, 0, 0},
    {2, 0, 0, 0, 3, 6, 0, 0, 0},
    {5, 0, 0, 0, 0, 0, 0, 0, 0},

    {0, 0, 0, 0, 0, 0, 0, 5, 0},
    {0, 8, 9, 1, 0, 0, 0, 0, 6},
    {0, 0, 0, 4, 0, 0, 7, 0, 0}};

bool CheckValid(int i, int j, int v);
bool Solve();

bool Solve()
{
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            if (sudoku[i][j] == 0)
            {
                for (int v = 1; v <= 9; v++)
                {
                    if (CheckValid(i, j, v))
                    {
                        sudoku[i][j] = v;
                        Solve();
                        if (isSolved)
                        {
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

bool CheckValid(int i, int j, int v)
{
    for (int x = 0; x < 9; x++)
    {
        if (i == x) continue;
        if (sudoku[x][j] == v) return false;
    }
    for (int y = 0; y < 9; y++)
    {
        if (j == y) continue;
        if (sudoku[i][y] == v) return false;
    }
    int xBegin = (int)floor((double)i / 3) * 3;
    int yBegin = (int)floor((double)j / 3) * 3;

    for (int x = xBegin; x < xBegin + 3; x++)
    {
        for (int y = yBegin; y < yBegin + 3; y++)
        {
            if (i == x && j == y) continue;
            if (sudoku[x][y] == v) return false;
        }
    }
    return true;
}

void Display(int array[9][9])
{
    std::cout << "+-------+-------+-------+" << std::endl;

    for (int i = 0; i < 9; i++)
    {
        std::cout << "| ";
        for (int j = 0; j < 9; j++)
        {
            if (array[i][j] == 0)
            {
                std::cout << "  ";
            }
            else
            {
                std::cout << array[i][j] << " ";
            }

            if ((j + 1) % 3 == 0)
            {
                std::cout << "| ";
            }
        }

        if ((i + 1) % 3 == 0)
        {
            std::cout << std::endl
                      << "+-------+-------+-------+";
        }
        std::cout << std::endl;
    }
}

int main()
{
    Display(sudoku);
    Solve();
    Display(sudoku);
    return 0;
}