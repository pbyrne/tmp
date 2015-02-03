package main

import "fmt"

func main() {
	for i, f := range [20]int{} {
		fmt.Println("-------")
		fmt.Println(i)
		fmt.Println(f)
	}
}
