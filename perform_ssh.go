package main

import (
	"bytes"
	"code.google.com/p/go.crypto/ssh"
	"fmt"
	"io/ioutil"
	"os"
	"os/user"
	"time"
)

func main() {
	cmd := "hostname"
	username := os.Args[1]
	hosts := os.Args[2:]
	results := make(chan string, 10)
	timeout := time.After(10 * time.Second)
	key, err := getKeyFile()
	panicIf(err)
	config := &ssh.ClientConfig{
		User: username,
		Auth: []ssh.AuthMethod{
			ssh.PublicKeys(key),
		},
	}

	for _, hostname := range hosts {
		go func(hostname string) {
			results <- executeCmd(cmd, hostname, config)
		}(hostname)
	}

	for _, _ = range hosts {
		select {
		case res := <-results:
			fmt.Println(res)
		case <-timeout:
			fmt.Println("Timed out!")
			return
		}
	}
}

func getKeyFile() (key ssh.Signer, err error) {
	usr, _ := user.Current()
	file := usr.HomeDir + "/.ssh/id_rsa"
	buff, err := ioutil.ReadFile(file)
	if err != nil {
		return nil, err
	}
	key, err = ssh.ParsePrivateKey(buff)
	if err != nil {
		return nil, err
	}
	return key, nil
}

func panicIf(err error) {
	if err != nil {
		panic(err)
	}
}

func executeCmd(cmd string, hostname string, config *ssh.ClientConfig) string {
	con, err := ssh.Dial("tcp", hostname+":22", config)
	panicIf(err)
	session, err := con.NewSession()
	panicIf(err)
	defer session.Close()

	var stdoutBuf bytes.Buffer
	session.Stdout = &stdoutBuf
	session.Run(cmd)

	return hostname + ": " + stdoutBuf.String()
}
