// Conway's Game of Life LIMITED BOARD

// board setup
int cellSize = 30; // might need to round this off

// variables for timing
boolean running = false;
int timer;

int row, col;
Cell[][] cells;

void setup() {
  size(1080, 720);
  row = width / cellSize;
  col = height / cellSize;

  // set up cell 2d array
  cells = new Cell[row][col];
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      cells[i][j] = new Cell(i, j);
    }
  }
}

void draw() {
  background(127);

  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      cells[i][j].draw();
    }
  }

  // run the cells every second
  if (running) {
    delay(1000);
    timer++;
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        cells[i][j].run();
      }
    }
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        cells[i][j].update();
      }
    }
  }

  // show the timer at the top right
  textSize(24);
  fill(255);
  text(timer, width-30, 30);
}

void mousePressed() {
  if (!running) {
    cells[(mouseX)/cellSize][(mouseY)/cellSize].flipState();
  }
}

void keyPressed() {
  if (key == ' ') {
    running = !running;
  }
}
