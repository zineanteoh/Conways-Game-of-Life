

// board setup
int cellSize = 10; // might need to round this off

// variables for timing
boolean running = false;
int timer;

// variables for dragging
boolean dragging;
int offsetX, offsetY;

// arraylist of active cells
ArrayList<Cell> activeCells;

void setup() {
  size(1080,720);
  background(127);
  timer = 0;
  dragging = false;
  offsetX = 0;
  offsetY = 0;
  
  activeCells = new ArrayList<Cell>();
}

void mousePressed() {
  dragging = true;
  // change the state of the clicked cell
  if (!running) {
    //cells[(mouseX-offsetX)/cellSize][(mouseY-offsetY)/cellSize].flipState();
  }
}

void mouseReleased() {
  dragging = false;
  // TODO: 
  // 1. let the grid 'snap' into place
  // 2. update all coordinates of active cells
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
  
  
  //for(int i = 0; i < row; i++) {
  //  for (int j = 0; j < col; j++) {
  //    cells[i][j].draw();
  //  }
  //}
  //if (running) {
  //  delay(1000);
  //  timer++;
  //}
  //textSize(24);
  //fill(255);
  //text(timer, width-30,30);
  
}
