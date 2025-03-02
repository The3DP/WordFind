class WordSearchGenerator {
  gridSize: number = 10;
  words: string[] = ['apple', 'banana', 'orange', 'grape'];
  grid: string[][];

  constructor() {
    // Initialize grid with spaces
    this.grid = Array.from({ length: this.gridSize }, () => Array(this.gridSize).fill(' '));
  }

  // Generate and print the word search
  generate(): void {
    this.placeWords();
    this.fillEmptyCells();
    this.printGrid();
  }

  // Place words in the grid
  placeWords(): void {
    for (const word of this.words) {
      this.placeWord(word);
    }
  }

  // Place a word either horizontally or vertically in the grid
  placeWord(word: string): void {
    const wordLength = word.length;
    let placed = false;

    while (!placed) {
      // Randomly choose horizontal or vertical direction
      const direction = Math.floor(Math.random() * 2);  // 0 = horizontal, 1 = vertical

      let row: number;
      let col: number;

      if (direction === 0) {
        // Horizontal placement
        row = Math.floor(Math.random() * this.gridSize);
        col = Math.floor(Math.random() * (this.gridSize - wordLength + 1));

        // Check if space is available
        if (this.allSpaceAvailable(row, col, wordLength, 'horizontal')) {
          for (let i = 0; i < wordLength; i++) {
            this.grid[row][col + i] = word[i];
          }
          placed = true;
        }
      } else {
        // Vertical placement
        row = Math.floor(Math.random() * (this.gridSize - wordLength + 1));
        col = Math.floor(Math.random() * this.gridSize);

        // Check if space is available
        if (this.allSpaceAvailable(row, col, wordLength, 'vertical')) {
          for (let i = 0; i < wordLength; i++) {
            this.grid[row + i][col] = word[i];
          }
          placed = true;
        }
      }
    }
  }

  // Check if there is enough space for the word (either horizontally or vertically)
  allSpaceAvailable(row: number, col: number, wordLength: number, direction: string): boolean {
    if (direction === 'horizontal') {
      for (let i = 0; i < wordLength; i++) {
        if (this.grid[row][col + i] !== ' ') {
          return false;  // Not enough space
        }
      }
    } else {
      for (let i = 0; i < wordLength; i++) {
        if (this.grid[row + i][col] !== ' ') {
          return false;  // Not enough space
        }
      }
    }

    return true;  // Enough space
  }

  // Fill empty cells with random letters
  fillEmptyCells(): void {
    for (let i = 0; i < this.gridSize; i++) {
      for (let j = 0; j < this.gridSize; j++) {
        if (this.grid[i][j] === ' ') {
          this.grid[i][j] = String.fromCharCode(Math.floor(Math.random() * 26) + 97);  // Random letter 'a' to 'z'
        }
      }
    }
  }

  // Print the grid in a readable format
  printGrid(): void {
    for (let i = 0; i < this.gridSize; i++) {
      console.log(this.grid[i].join(' '));
    }
  }
}

// Create an instance of the WordSearchGenerator class and generate the word search
const wordSearch = new WordSearchGenerator();
wordSearch.generate();
