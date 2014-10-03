package main

import (
	"bytes"
	"code.google.com/p/go.crypto/ssh"
	"fmt"
	"io/ioutil"
	"os"
	"os/user"
)

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

func main() {
	username := os.Args[1]
	hosts := os.Args[2:]
	cmd := "hostname"
	key, err := getKeyFile()
	if err != nil {
		panic(err)
	}
	config := &ssh.ClientConfig{
		User: username,
		Auth: []ssh.AuthMethod{
			ssh.PublicKeys(key),
		},
	}

	for _, host := range hosts {
		client, err := ssh.Dial("tcp", host+":22", config)
		if err != nil {
			panic(err)
		}
		session, err := client.NewSession()
		if err != nil {
			panic(err)
		}
		defer session.Close()
		var b bytes.Buffer
		session.Stdout = &b
		err = session.Run(cmd)
		if err != nil {
			panic(err)
		}
		fmt.Println(b.String())
	}
}
