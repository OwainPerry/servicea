package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "service a - version 2.1")
	})
	http.ListenAndServe(":8080", nil)
}
