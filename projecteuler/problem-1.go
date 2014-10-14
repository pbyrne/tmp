package main

import (
  "fmt"
)

func main() {
  ceiling := 10
  sum := 0

  for i := 0; i < ceiling; i++ {
    if i % 3 == 0 || i % 5 == 0 {
      sum = sum + i
      fmt.Println("Current sum is", sum)
    }
  }

  fmt.Println("\n\nTotal sum is", sum)
}


