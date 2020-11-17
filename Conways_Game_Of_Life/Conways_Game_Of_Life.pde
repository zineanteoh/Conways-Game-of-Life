// Conway's Game of Life LIMITED BOARD

/*
Press SPACE to RUN / STOP simulation
Press 'R' to Randomize Board
Press UP to increase speed
Press DOWN to decrease speed
*/

// board setup
int cellSize = 30; // might need to round this off
int row, col;
Cell[][] cells;

// variables for timing
boolean running = false;
int timer;
int waitDuration = 200;

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
    delay(waitDuration);
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
  textAlign(RIGHT);
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
  } else if (key == 'r') {
    randomBoard();
  } else if (keyCode == UP) {
    if (waitDuration > 50) {
      waitDuration -= 50;
    }
  } else if (keyCode == DOWN) {
    if (waitDuration < 1000) {
      waitDuration += 50;
    }
  }
}

void randomBoard() {
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      int rand = int(random(0,2));
      if (rand == 1) {
        cells[i][j].flipState();
      }
    }
  }
}
