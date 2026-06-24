package com.example.course;

import java.util.Map;
import java.util.stream.LongStream;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {
    private static final String SERVICE_NAME = "java-spring";

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @GetMapping("/")
    public Map<String, Object> index() {
        return Map.of(
            "service", SERVICE_NAME,
            "language", "Java",
            "framework", "Spring Boot",
            "message", "hello from Java Spring"
        );
    }

    @GetMapping("/healthz")
    public Map<String, Object> healthz() {
        return Map.of("status", "ok", "service", SERVICE_NAME);
    }

    @GetMapping("/work")
    public Map<String, Object> work() {
        long started = System.nanoTime();
        long result = LongStream.range(0, 10_000).sum();
        double elapsedMs = (System.nanoTime() - started) / 1_000_000.0;
        return Map.of("service", SERVICE_NAME, "result", result, "elapsed_ms", elapsedMs);
    }
}

