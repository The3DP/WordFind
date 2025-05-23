use strict;
use warnings;

# WordSearchGenerator: Generates and prints a word search grid.
sub word_search_generator {
    my $grid_size = 10;
    my @words = ('apple', 'banana', 'orange', 'grape');
    
    # Initialize grid with spaces
    my @grid;
    for my $i (0..$grid_size-1) {
        for my $j (0..$grid_size-1) {
            $grid[$i][$j] = ' ';
        }
    }
    
    # Place words in the grid
    for my $word (@words) {
        place_word(\@grid, $word);
    }
    
    # Fill empty spaces with random letters
    fill_empty_cells(\@grid);
    
    # Print the grid
    print_grid(\@grid);
}

# place_word: Places a word either horizontally or vertically in the grid.
sub place_word {
    my ($grid_ref, $word) = @_;
    my $word_length = length($word);
    my $placed = 0;
    
    while (!$placed) {
        # Randomly choose horizontal or vertical direction
        my $direction = int(rand(2));  # 0 = horizontal, 1 = vertical
        
        if ($direction == 0) {
            # Horizontal placement
            my $row = int(rand(10));
            my $col = int(rand(10 - $word_length + 1));
            
            # Check if space is available
            if (all_space_available($grid_ref, $row, $col, $word_length, 'horizontal')) {
                for my $i (0..$word_length-1) {
                    $grid_ref->[$row][$col + $i] = substr($word, $i, 1);
                }
                $placed = 1;
            }
        } else {
            # Vertical placement
            my $row = int(rand(10 - $word_length + 1));
            my $col = int(rand(10));
            
            # Check if space is available
            if (all_space_available($grid_ref, $row, $col, $word_length, 'vertical')) {
                for my $i (0..$word_length-1) {
                    $grid_ref->[$row + $i][$col] = substr($word, $i, 1);
                }
                $placed = 1;
            }
        }
    }
}

# Check if there is enough space for the word (either horizontally or vertically)
sub all_space_available {
    my ($grid_ref, $row, $col, $word_length, $direction) = @_;
    
    if ($direction eq 'horizontal') {
        for my $i (0..$word_length-1) {
            if ($grid_ref->[$row][$col + $i] ne ' ') {
                return 0;  # Not enough space
            }
        }
    } else {  # vertical
        for my $i (0..$word_length-1) {
            if ($grid_ref->[$row + $i][$col] ne ' ') {
                return 0;  # Not enough space
            }
        }
    }
    
    return 1;  # Enough space
}

# fill_empty_cells: Fills empty cells with random letters.
sub fill_empty_cells {
    my ($grid_ref) = @_;
    
    for my $i (0..9) {
        for my $j (0..9) {
            if ($grid_ref->[$i][$j] eq ' ') {
                $grid_ref->[$i][$j] = chr(int(rand(26)) + 97);  # Random letter 'a' to 'z'
            }
        }
    }
}

# print_grid: Prints the grid in a readable format.
sub print_grid {
    my ($grid_ref) = @_;
    
    for my $i (0..9) {
        print join(" ", @{$grid_ref->[$i]}), "\n";
    }
}

# Call the word search generator
word_search_generator();
--------
---------
----------
