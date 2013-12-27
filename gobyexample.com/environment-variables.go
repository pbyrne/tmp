package main

import "fmt"
import "os"
import "strings"

func main() {
  os.Setenv("FOO", "1")
  fmt.Println("FOO:", os.Getenv("FOO"))
  fmt.Println("BAR:", os.Getenv("BAR"))

  fmt.Println()
  for _, e := range os.Environ() {
    pairs := strings.Split(e, "=")
    fmt.Println(pairs[0])
  }
}
