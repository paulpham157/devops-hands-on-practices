use std::env;
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::time::Instant;

const SERVICE_NAME: &str = "rust-http";

fn main() -> std::io::Result<()> {
    if env::args().any(|arg| arg == "--healthcheck") {
        return Ok(());
    }

    let listener = TcpListener::bind("0.0.0.0:8080")?;
    println!("rust-http listening on :8080");

    for stream in listener.incoming() {
        match stream {
            Ok(stream) => handle_connection(stream)?,
            Err(error) => eprintln!("connection error: {error}"),
        }
    }

    Ok(())
}

fn handle_connection(mut stream: TcpStream) -> std::io::Result<()> {
    let mut buffer = [0_u8; 1024];
    let size = stream.read(&mut buffer)?;
    let request = String::from_utf8_lossy(&buffer[..size]);
    let path = request
        .lines()
        .next()
        .and_then(|line| line.split_whitespace().nth(1))
        .unwrap_or("/");

    let (status, body) = match path {
        "/" => (
            "200 OK",
            format!(
                r#"{{"service":"{SERVICE_NAME}","language":"Rust","framework":"std::net","message":"hello from Rust"}}"#
            ),
        ),
        "/healthz" => ("200 OK", format!(r#"{{"status":"ok","service":"{SERVICE_NAME}"}}"#)),
        "/work" => {
            let started = Instant::now();
            let result: u64 = (0..10_000).sum();
            let elapsed_ms = started.elapsed().as_secs_f64() * 1000.0;
            (
                "200 OK",
                format!(
                    r#"{{"service":"{SERVICE_NAME}","result":{result},"elapsed_ms":{elapsed_ms:.3}}}"#
                ),
            )
        }
        _ => ("404 Not Found", r#"{"error":"not found"}"#.to_string()),
    };

    let response = format!(
        "HTTP/1.1 {status}\r\nContent-Type: application/json\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{body}",
        body.len()
    );

    stream.write_all(response.as_bytes())?;
    stream.flush()
}

