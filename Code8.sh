#!/bin/bash

# WordSearchGenerator: Generates and prints a word search grid.
word_search_generator() {
    grid_size=10
    words=("apple" "banana" "orange" "grape")
    
    # Initialize grid with spaces
    declare -A grid
    for ((i=0; i<grid_size; i++)); do
        for ((j=0; j<grid_size; j++)); do
            grid[$i,$j]=" "
        done
    done
    
    # Place words in the grid
    for word in "${words[@]}"; do
        place_word "$word"
    done
    
    # Fill empty spaces with random letters
    fill_empty_cells
    
    # Print the grid
    print_grid
}

# place_word: Places a word either horizontally or vertically in the grid.
place_word() {
    local word=$1
    local word_length=${#word}
    local placed=0
    
    while [[ $placed -eq 0 ]]; do
        # Randomly choose horizontal or vertical direction
        direction=$((RANDOM % 2))  # 0 = horizontal, 1 = vertical
        
        if [[ $direction -eq 0 ]]; then
            # Horizontal placement
            row=$((RANDOM % grid_size))
            col=$((RANDOM % (grid_size - word_length + 1)))
            
            # Check if space is available
            if all_space_available $row $col $word_length "horizontal"; then
                for ((i=0; i<word_length; i++)); do
                    grid[$row,$((col + i))]="${word:$i:1}"
                done
                placed=1
            fi
        else
            # Vertical placement
            row=$((RANDOM % (grid_size - word_length + 1)))
            col=$((RANDOM % grid_size))
            
            # Check if space is available
            if all_space_available $row $col $word_length "vertical"; then
                for ((i=0; i<word_length; i++)); do
                    grid[$((row + i)),$col]="${word:$i:1}"
                done
                placed=1
            fi
        fi
    done
}

# Check if there is enough space for the word (either horizontally or vertically)
all_space_available() {
    local row=$1
    local col=$2
    local word_length=$3
    local direction=$4
    
    if [[ $direction == "horizontal" ]]; then
        for ((i=0; i<word_length; i++)); do
            if [[ ${grid[$row,$((col + i))]} != " " ]]; then
                return 1  # Not enough space
            fi
        done
    else
        for ((i=0; i<word_length; i++)); do
            if [[ ${grid[$((row + i)),$col]} != " " ]]; then
                return 1  # Not enough space
            fi
        done
    fi
    
    return 0  # Enough space
}

# fill_empty_cells: Fills empty cells with random letters.
fill_empty_cells() {
    for ((i=0; i<grid_size; i++)); do
        for ((j=0; j<grid_size; j++)); do
            if [[ ${grid[$i,$j]} == " " ]]; then
                grid[$i,$j]=$(tr -dc 'a-z' </dev/urandom | head -c 1)  # Random letter 'a' to 'z'
            fi
        done
    done
}

# print_grid: Prints the grid in a readable format.
print_grid() {
    for ((i=0; i<grid_size; i++)); do
        row=""
        for ((j=0; j<grid_size; j++)); do
            row+="${grid[$i,$j]} "
        done
        echo "$row"
    done
}

# Call the word search generator
word_search_generator
