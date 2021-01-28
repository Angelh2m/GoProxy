package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"golang.org/x/crypto/ssh"
)

func main() {

	user := "ubuntu"
	address := os.Args[1:][0]
	port := "22"

	fmt.Println("Start ....")
	// 	export EC2_KEY_PAIR_OHIO="Proxy_Ohio"
	// export EC2_SG_OHIO="sg-057d3f5d45c52e654"
	// export EC2_KEY_OHIO="/Users/home/Keys/Proxy_Ohio.pem"

	key, err := ioutil.ReadFile(os.Getenv("EC2_KEY_PATH_OHIO"))

	if err != nil {
		log.Fatalf("unable to read private key: %v", err)
	}

	// Create the Signer for this private key.
	signer, err := ssh.ParsePrivateKey(key)
	if err != nil {
		log.Fatalf("unable to parse private key: %v", err)
	}

	config := &ssh.ClientConfig{
		User: user,
		Auth: []ssh.AuthMethod{
			// Add in password check here for more security.
			ssh.PublicKeys(signer),
		},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(),
	}

	// Connect to the remote server and perform the SSH handshake.
	client, err := ssh.Dial("tcp", address+":"+port, config)

	if err != nil {
		log.Fatalf("unable to connect: %v", err)
	}

	defer client.Close()

	ss, err := client.NewSession()

	if err != nil {
		log.Fatal("unable to create SSH session: ", err)
	}

	defer ss.Close()

	fmt.Println("Connected...")

	command := `
		curl https://raw.githubusercontent.com/Angelh2m/GoProxy/master/start.sh --output ~/start.sh
	`

	run := "sudo sh start.sh"

	// Creating the buffer which will hold the remotly executed command's output.
	var stdoutBuf bytes.Buffer
	ss.Stdout = &stdoutBuf

	ss.Run(command)
	fmt.Println(stdoutBuf.String())

	ss.Run(run)
	fmt.Println(stdoutBuf.String())
}
