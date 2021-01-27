package main

import (
	"log"
	"net/http"

	"github.com/elazarl/goproxy"
)

func proxy() {
	proxy := goproxy.NewProxyHttpServer()
	proxy.Verbose = true
	log.Fatal(http.ListenAndServe(":8888", proxy))
}
