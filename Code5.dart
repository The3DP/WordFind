import 'dart:math';

void main() {
  WordSearchGenerator wordSearch = WordSearchGenerator();
  wordSearch.generate();
}

class WordSearchGenerator {
  final int gridSize = 10;
  final List<String> words = ['apple', 'banana', 'orange', 'grape'];
  late List<List<String>> grid;

  WordSearchGenerator() {
    grid = List.generate(gridSize, (_) => List.generate(gridSize, (_) => ' '));
  }

  void generate() {
    initializeGrid();
    placeWords();
    fillEmptyCells();
    printGrid();
  }

  // Initialize the grid with spaces
  void initializeGrid() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        grid[i][j] = ' ';
      }
    }
  }

  // Place words in the grid
  void placeWords() {
    for (String word in words) {
      placeWord(word.toLowerCase());
    }
  }

  // Place a word in the grid (either horizontally or vertically)
  void placeWord(String word) {
    int wordLength = word.length;
    bool placed = false;
    Random random = Random();

    while (!placed) {
      // Randomly choose horizontal or vertical direction
      String direction = random.nextBool() ? 'horizontal' : 'vertical';
      int row, col;

      if (direction == 'horizontal') {
        row = random.nextInt(gridSize);
        col = random.nextInt(gridSize - wordLength + 1);
        // Check if space is available
        if (grid[row].sublist(col, col + wordLength).every((cell) => cell == ' ')) {
          // Place word horizontally
          for (int i = 0; i < wordLength; i++) {
            grid[row][col + i] = word[i];
          }
          placed = true;
        }
      } else { // vertical
        row = random.nextInt(gridSize - wordLength + 1);
        col = random.nextInt(gridSize);
        // Check if space is available
        bool canPlace = true;
        for (int i = 0; i < wordLength; i++) {
          if (grid[row + i][col] != ' ') {
            canPlace = false;
            break;
          }
        }
        if (canPlace) {
          // Place word vertically
          for (int i = 0; i < wordLength; i++) {
            grid[row + i][col] = word[i];
          }
          placed = true;
        }
      }
    }
  }

  // Fill empty cells with random letters
  void fillEmptyCells() {
    Random random = Random();
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (grid[i][j] == ' ') {
          grid[i][j] = String.fromCharCode(random.nextInt(26) + 97); // a-z
        }
      }
    }
  }

  // Print the grid
  void printGrid() {
    for (int i = 0; i < gridSize; i++) {
      print(grid[i].join(' '));
    }
  }
}
