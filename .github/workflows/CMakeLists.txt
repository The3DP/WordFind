name: CMake on multiple platforms

on: [push, pull_request]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Configure CMake
      run: cmake -S . -B build
    - name: Build
      run: cmake --build build
