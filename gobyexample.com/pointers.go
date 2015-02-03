package main

import "fmt"

func zeroval(ival int) {
	ival = 0
}

func zeropointer(iptr *int) {
	*iptr = 0
}

func main() {
	i := 1
	fmt.Println("initval:", i)

	zeroval(i)
	fmt.Println("zeroval:", i)

	zeropointer(&i)
	fmt.Println("zeropointer:", i)

	fmt.Println("pointer:", &i)
}
