class Cell {
  
  boolean state; // false = dead; true = live
  boolean nextState;
  int rowID, colID, x, y; 
  
  Cell(int tempR, int tempC) {
    rowID = tempR;
    colID = tempC;
    x = width/row*rowID;
    y = height/col*colID;
    state = false;
  }
  
  void draw() {
    if (state) {
      fill(0,255,255);
    } else {
      fill(127);
    }
    stroke(255);
    strokeWeight(1.0);
    rect(x+offsetX,y+offsetY,cellSize,cellSize);
  }
  
  //void run() {
  //  // find its nextState
  //  int liveNeighbors = getLiveNeighbors();
  //  if (state) {
  //    // "Any live cell with two or three live neighbours survives"
  //    if (liveNeighbors == 2 || liveNeighbors == 3) {
  //      nextState = true;
  //    } else {
  //      nextState = false;
  //    }
  //  } else {
  //    // "Any dead cell with three live neighbours becomes a live cell"
  //    if (liveNeighbors == 3) {
  //      nextState = true;
  //    } else {
  //      nextState = false;
  //    }
  //  }
  //}
  
  //int getLiveNeighbors() {
  //  int counter = 0;
  //  for(int i = -1; i <= 1; i++) {
  //    for(int j = -1; j <= 1; j++) {
  //      counter += (cells[rowID+i][colID+j].state) ? 0 : 1;
  //    }
  //  }
  //  return counter;
  //}
  
  void flipState() {
    if (!state) {
      // Add this cell to ArrayList activeCells if cell is originally dead
      activeCells.add(this);
    } else if (activeCells.contains(this)) {
      // Remove this cell from ArrayList activeCells if cell is originally alive
      activeCells.remove(this);
    }
    state = !state;
  }
  
}
