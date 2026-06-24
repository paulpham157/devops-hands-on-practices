# Solution: WebSocket vs SSE

1. Chat app: WebSocket, because both sides send messages.
2. Build log streaming: SSE, because server-to-client streaming is enough.
3. Stock ticker: SSE is often enough if clients only receive updates.
4. Multiplayer game: WebSocket, because clients send inputs and receive state updates.
5. Job progress: SSE is often enough because the server pushes progress events.

