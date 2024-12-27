#!/bin/bash

# This script demonstrates a race condition.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously
process1(){ 
  echo "Process 1 writing to file1.txt" >> file1.txt 
  sleep 1 
  echo "Process 1 finished" >> file1.txt 
}

process2(){ 
  echo "Process 2 writing to file2.txt" >> file2.txt 
  sleep 1 
  echo "Process 2 finished" >> file2.txt 
}

# Run the processes in the background
process1 &
process2 &

# Wait for both processes to finish
wait

# Display the contents of the files
cat file1.txt
cat file2.txt