package main

import (
	"crypto/md5"
	"fmt"
	"io/ioutil"
)

func main() {
	data, err := ioutil.ReadFile("/Users/pbyrne/workspace/go/src/github.com/pbyrne/bucket/public/javascripts/application.js")
	if err != nil {
		panic(err)
	}
	hash := md5.Sum(data)

	fmt.Println("raw")
	fmt.Println(hash)
	fmt.Println("--------")
	fmt.Println("%s")
	fmt.Println(fmt.Sprintf("%s", hash))
	fmt.Println("--------")
	fmt.Println("%v")
	fmt.Println(fmt.Sprintf("%v", hash))
	fmt.Println("--------")
	fmt.Println("%x")
	fmt.Println(fmt.Sprintf("%x", hash))
}
