package main

import (
	"encoding/json"
	"flag"
	"log"
	"net/http"
	"time"
)

const serviceName = "go-http"

func writeJSON(w http.ResponseWriter, status int, payload map[string]any) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	if err := json.NewEncoder(w).Encode(payload); err != nil {
		log.Printf("write response: %v", err)
	}
}

func main() {
	healthcheck := flag.Bool("healthcheck", false, "run local health check")
	flag.Parse()

	if *healthcheck {
		return
	}

	mux := http.NewServeMux()
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		writeJSON(w, http.StatusOK, map[string]any{
			"service":   serviceName,
			"language":  "Go",
			"framework": "net/http",
			"message":   "hello from Go",
		})
	})
	mux.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		writeJSON(w, http.StatusOK, map[string]any{"status": "ok", "service": serviceName})
	})
	mux.HandleFunc("/work", func(w http.ResponseWriter, r *http.Request) {
		started := time.Now()
		result := 0
		for i := 0; i < 10000; i++ {
			result += i
		}
		writeJSON(w, http.StatusOK, map[string]any{
			"service":    serviceName,
			"result":     result,
			"elapsed_ms": float64(time.Since(started).Microseconds()) / 1000,
		})
	})

	log.Println("go-http listening on :8080")
	log.Fatal(http.ListenAndServe(":8080", mux))
}

