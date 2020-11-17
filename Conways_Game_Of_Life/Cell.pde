class Cell {

  boolean state; // false = dead; true = alive
  boolean nextState;
  int rowID, colID, x, y;

  Cell(int tempRowID, int tempColID) {
    state = false;
    rowID = tempRowID;
    colID = tempColID;
    x = width/row*rowID;
    y = height/col*colID;
  }

  void draw() {
    if (state) {
      fill(0,255,255);
    } else {
      fill(127);
    }
    stroke(255);
    strokeWeight(1.0);
    rect(x, y, cellSize, cellSize);
  }

  void run() {
    int liveNeighbors = getNeighborCount();
    if (state) {
      if (liveNeighbors == 2 || liveNeighbors == 3) {
        nextState = true;
      } else {
        nextState = false;
      }
    } else {
      if (liveNeighbors == 3) {
        nextState = true;
      } else {
        nextState = false;
      }
    }
  }
  
  int getNeighborCount() {
    int count = 0;
    for(int i = -1; i <= 1; i++) {
      for(int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) {
          continue;
        }
        if (rowID+i < 0 || rowID+i >= row || colID+j < 0 || colID+j >= col) {
          continue;
        }
        count += ((cells[rowID+i][colID+j].state == true) ? 1 : 0);
      }
    }
    
    return count;
  }
  
  void update() {
    state = nextState;
  }

  void flipState() {
    state = !state;
  } 
  
  void flipState(boolean newState) {
    state = newState;
  }
}
