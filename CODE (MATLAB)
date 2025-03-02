function WordSearchGenerator()
    % WordSearchGenerator: Generates and prints a word search grid.
    
    % Grid size
    gridSize = 10;
    
    % List of words to place in the grid
    words = {'apple', 'banana', 'orange', 'grape'};
    
    % Initialize grid with spaces
    grid = repmat(' ', gridSize, gridSize);
    
    % Place words in the grid
    for i = 1:length(words)
        placeWord(grid, words{i});
    end
    
    % Fill empty spaces with random letters
    fillEmptyCells(grid);
    
    % Print the grid
    printGrid(grid);
end

function placeWord(grid, word)
    % placeWord: Places a word either horizontally or vertically in the grid.
    
    wordLength = length(word);
    placed = false;
    
    while ~placed
        % Randomly choose horizontal or vertical direction
        direction = randi([0, 1]); % 0 = horizontal, 1 = vertical
        
        if direction == 0
            % Horizontal placement
            row = randi([1, size(grid, 1)]);
            col = randi([1, size(grid, 2) - wordLength + 1]);
            
            % Check if space is available
            if all(grid(row, col:col+wordLength-1) == ' ')
                grid(row, col:col+wordLength-1) = word;
                placed = true;
            end
        else
            % Vertical placement
            row = randi([1, size(grid, 1) - wordLength + 1]);
            col = randi([1, size(grid, 2)]);
            
            % Check if space is available
            if all(grid(row:row+wordLength-1, col) == ' ')
                grid(row:row+wordLength-1, col) = word.';
                placed = true;
            end
        end
    end
end

function fillEmptyCells(grid)
    % fillEmptyCells: Fills empty cells with random letters.
    
    [rows, cols] = size(grid);
    
    for i = 1:rows
        for j = 1:cols
            if grid(i, j) == ' '
                grid(i, j) = char(randi([97, 122])); % Random letter 'a' to 'z'
            end
        end
    end
end

function printGrid(grid)
    % printGrid: Prints the grid in a readable format.
    
    for i = 1:size(grid, 1)
        disp(grid(i, :));
    end
end
