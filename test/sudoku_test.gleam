import sudoku
import gleam/should

pub fn hello_world_test() {
  sudoku.hello_world()
  |> should.equal("Hello, from sudoku!")
}
