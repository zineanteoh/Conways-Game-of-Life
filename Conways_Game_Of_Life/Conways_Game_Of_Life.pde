

// board setup
int cellSize = 10; // might need to round this off

// variables for timing
boolean running = false;
int timer;

// variables for dragging
boolean dragging;
int offsetX, offsetY;
int pressedX, pressedY;

// arraylist of active cells
ArrayList<Cell> activeCells;

// TEMPORARY VARIABLES
int row, col;
Cell[][] cells;

void setup() {
  size(1080,720);
  background(127);
  timer = 0;
  dragging = false;
  offsetX = 0;
  offsetY = 0;
  row = width / cellSize;
  col = height / cellSize;
  
  activeCells = new ArrayList<Cell>();
  
  // TEMPORARY STUFFS
  cells = new Cell[row][col];
  for(int i = 0; i < row; i++) {
    for(int j = 0; j < col; j++) {
      cells[i][j] = new Cell(i,j);
    }
  }
}

void mousePressed() {
  pressedX = mouseX;
  pressedY = mouseY;
  dragging = true;
  
}

void mouseReleased() {
  dragging = false;
  
  // change the state of the clicked cell
  if (!running && pressedX == mouseX && pressedY == mouseY) {
    cells[(mouseX-offsetX)/cellSize][(mouseY-offsetY)/cellSize].flipState();
  }
  // TODO: 
  // 1. let the grid 'snap' into place
  // 2. update all coordinates of active cells
  // 3. SET offsetX = 0;
  //    and offsetY = 0;
}

void mouseDragged() {
  offsetX += mouseX - pmouseX;
  offsetY += mouseY - pmouseY;
}

void keyPressed() {
  if (key == ' ') {
    running = !running;
  }
}

void draw() {
  background(127);
  
  
  for(int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      cells[i][j].draw();
    }
  }
  //if (running) {
  //  delay(1000);
  //  timer++;
  //}
  //textSize(24);
  //fill(255);
  //text(timer, width-30,30);
  
}
