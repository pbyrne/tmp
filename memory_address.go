package main

import (
  "fmt"
)

func main() {
  i := 1
  fmt.Println("From main, i:", &i)

  for j := 0; j < 10; j++ {
    k := 1
    fmt.Println("From loop, k:", &k)
  }

  go func() {
    for l := 0; l < 10; l++ {
      m := 0
      fmt.Println("From gofunc, m", &m)
    }
  }()

  fmt.Println("Any key to complete")
  var input string
  fmt.Scanln(&input)
  fmt.Println("done")
}
