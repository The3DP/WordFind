#include <Arduino.h>

const int gridSize = 10;  // Size of the word search grid
char grid[gridSize][gridSize];  // Grid to hold the characters

void setup() {
  // Start serial communication
  Serial.begin(9600);
  
  // Initialize the grid with empty spaces
  initializeGrid();
  
  // Words to be placed in the grid
  String words[] = {"apple", "banana", "orange", "grape"};
  
  // Place each word in the grid
  for (int i = 0; i < 4; i++) {
    placeWord(words[i]);
  }
  
  // Fill empty spaces with random letters
  fillRandomLetters();
  
  // Print the grid to the serial monitor
  printGrid();
}

void loop() {
  // Nothing to do in the loop for now
}

// Initialize the grid with spaces
void initializeGrid() {
  for (int row = 0; row < gridSize; row++) {
    for (int col = 0; col < gridSize; col++) {
      grid[row][col] = ' ';
    }
  }
}

// Function to place a word in the grid
void placeWord(String word) {
  int wordLength = word.length();
  bool placed = false;

  while (!placed) {
    // Choose a random direction (0 for horizontal, 1 for vertical)
    int direction = random(2);
    int row, col;

    if (direction == 0) {  // Horizontal
      row = random(gridSize);
      col = random(gridSize - wordLength);  // Ensure there's enough space for the word

      bool canPlace = true;
      for (int i = 0; i < wordLength; i++) {
        if (grid[row][col + i] != ' ') {
          canPlace = false;
          break;
        }
      }

      if (canPlace) {
        for (int i = 0; i < wordLength; i++) {
          grid[row][col + i] = word[i];
        }
        placed = true;
      }
    } else {  // Vertical
      row = random(gridSize - wordLength);  // Ensure there's enough space for the word
      col = random(gridSize);

      bool canPlace = true;
      for (int i = 0; i < wordLength; i++) {
        if (grid[row + i][col] != ' ') {
          canPlace = false;
          break;
        }
      }

      if (canPlace) {
        for (int i = 0; i < wordLength; i++) {
          grid[row + i][col] = word[i];
        }
        placed = true;
      }
    }
  }
}

// Fill any remaining empty spaces with random letters
void fillRandomLetters() {
  for (int row = 0; row < gridSize; row++) {
    for (int col = 0; col < gridSize; col++) {
      if (grid[row][col] == ' ') {
        grid[row][col] = char(random(26) + 'a');  // Fill with a random letter
      }
    }
  }
}

// Print the grid to the serial monitor
void printGrid() {
  for (int row = 0; row < gridSize; row++) {
    for (int col = 0; col < gridSize; col++) {
      Serial.print(grid[row][col]);
      Serial.print(" ");
    }
    Serial.println();
  }
}
