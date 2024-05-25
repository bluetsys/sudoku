static mut IS_SOLVED: bool = false;
static mut SUDOKU: [[i32; 9]; 9] = [
    [0, 0, 0, 0, 0, 9, 8, 0, 0],
    [0, 0, 0, 0, 7, 0, 0, 6, 2],
    [8, 0, 0, 0, 0, 2, 0, 0, 7],
    [0, 0, 7, 8, 0, 0, 4, 0, 0],
    [2, 0, 0, 0, 3, 6, 0, 0, 0],
    [5, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 5, 0],
    [0, 8, 9, 1, 0, 0, 0, 0, 6],
    [0, 0, 0, 4, 0, 0, 7, 0, 0],
];

unsafe fn solve() {
    for i in 0..9 {
        for j in 0..9 {
            if SUDOKU[i][j] == 0 {
                for v in 1..10 {
                    if checkvalid(i, j, v) {
                        SUDOKU[i][j] = v;
                        if IS_SOLVED {
                            return;
                        }
                        solve();
                        SUDOKU[i][j] = 0;
                    }
                }
                return;
            }
        }
    }

    IS_SOLVED = true;
}

unsafe fn checkvalid(i: usize, j: usize, v: i32) -> bool {
    let _x: usize;
    let _y: usize;

    for _x in 0..9 {
        if i == _x {
            continue;
        }
        if SUDOKU[_x][j] == v {
            return false;
        }
    }

    for _y in 0..9 {
        if j == _y {
            continue;
        }
        if SUDOKU[i][_y] == v {
            return false;
        }
    }

    let x_begin: usize = ((i as f32 / 3.0).floor() * 3.0) as usize;
    let y_begin: usize = ((j as f32 / 3.0).floor() * 3.0) as usize;

    for _x in x_begin..x_begin + 3 {
        for _y in y_begin..y_begin + 3 {
            // println!("{} {} {} {}", i, j, _x, _y);
            if i == _x && j == _y {
                continue;
            }
            if SUDOKU[_x][_y] == v {
                return false;
            }
        }
    }

    return true;
}

fn display(arr: [[i32; 9]; 9]) {
    print!("+-------+-------+-------+\r\n");

    for i in 0..9 {
        print!("| ");
        for j in 0..9 {
            if arr[i][j] == 0 {
                print!("  ");
            } else {
                print!("{} ", arr[i][j]);
            }

            if (j + 1) % 3 == 0 {
                print!("| ");
            }
        }

        if (i + 1) % 3 == 0 {
            print!("\r\n+-------+-------+-------+");
        }
        println!();
    }
}

fn main() {
    unsafe {
        display(SUDOKU);
        solve();
        display(SUDOKU);
    }
}
