local isSolved = false;
local sudoku = {{0, 0, 0, 0, 0, 9, 8, 0, 0}, {0, 0, 0, 0, 7, 0, 0, 6, 2}, {8, 0, 0, 0, 0, 2, 0, 0, 7},

                {0, 0, 7, 8, 0, 0, 4, 0, 0}, {2, 0, 0, 0, 3, 6, 0, 0, 0}, {5, 0, 0, 0, 0, 0, 0, 0, 0},

                {0, 0, 0, 0, 0, 0, 0, 5, 0}, {0, 8, 9, 1, 0, 0, 0, 0, 6}, {0, 0, 0, 4, 0, 0, 7, 0, 0}};

function Solve()
    for i = 0, 8 do
        for j = 0, 8 do
            if (sudoku[i + 1][j + 1] == 0) then
                for v = 1, 9 do
                    if (CheckValid(i, j, v)) then
                        sudoku[i + 1][j + 1] = v;
                        Solve();
                        if (isSolved) then
                            return;
                        end;
                        sudoku[i + 1][j + 1] = 0;
                    end;
                end;
                return;
            end;
        end;
    end;
    isSolved = true;
end;

function CheckValid(i, j, v)
    for x = 0, 8 do
        if (i == x) then
            goto continue;
        end;
        if (sudoku[x + 1][j + 1] == v) then
            return false;
        end;
        ::continue::
    end;
    for y = 0, 8 do
        if (j == y) then
            goto continue;
        end;
        if (sudoku[i + 1][y + 1] == v) then
            return false;
        end;
        ::continue::
    end;

    local xBegin = math.floor(i / 3) * 3;
    local yBegin = math.floor(j / 3) * 3;

    for x = xBegin, xBegin + 2 do
        for y = yBegin, yBegin + 2 do
            if (i == x and j == y) then
                goto continue;
            end;
            if (sudoku[x + 1][y + 1] == v) then
                return false;
            end;
            ::continue::
        end;
    end;

    return true;
end;

function Display()
    io.write("+-------+-------+-------+\r\n");
    for i = 1, 9 do
        io.write("| ");
        for j = 1, 9 do
            if (sudoku[i][j] == 0) then
                io.write("  ");
            else
                io.write(sudoku[i][j]);
                io.write(" ");
            end;
            if j % 3 == 0 then
                io.write("| ");
            end;
        end;
        if i % 3 == 0 then
            io.write("\r\n+-------+-------+-------+");
        end;
        io.write("\r\n");
    end;

end;

-- print(sudoku[1][1]);
Display();
Solve();
Display();
