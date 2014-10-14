package main

import (
  "fmt"
)

func main() {
  ceiling := 10
  sum := 0

  for i := 0; i < ceiling; i++ {
    sum = sum + addIfMultiple(i)
    fmt.Println("Current sum is", sum)
  }

  fmt.Println("\n\nTotal sum is", sum)
}

func addIfMultiple(i int) int {
  if i % 3 == 0 || i % 5 == 0 {
    return i
  } else {
    return 0
  }
}

