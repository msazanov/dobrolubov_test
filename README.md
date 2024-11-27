
# dobrolubov_test

This project contains two Docker containers:
1. **test-app**: Runs the `monitor.sh` script to check and log the status of the `test` process.
2. **test-server**: A simple HTTPS server built with nginx, logging requests to `/monitoring/test/api`.

## Features
- `test-app`:
  - Periodically checks if the `test` process is running.
  - Logs process restarts and server unavailability in `/var/log/monitoring.log`.
- `test-server`:
  - Handles HTTPS requests and logs them in `/var/log/nginx/api_access.log`.

## Prerequisites
- Docker >= 20.10
- Docker Compose >= 2.0

## Setup
1. Clone the repository:
   ```bash
   git clone git@github.com:msazanov/dobrolubov_test.git
   cd dobrolubov_test
   ```
2. Build and start containers:
   ```bash
   docker-compose build
   docker-compose up -d
   ```

## Usage
- **Access containers**:
  - `test-app`:
    ```bash
    docker exec -it test-app bash
    ```
  - `test-server`:
    ```bash
    docker exec -it test-server bash
    ```

- **Start the `test` process**:
  ```bash
  docker exec -it test-app /srv/test/test
  ```

- **Stop the `test` process**:
  ```bash
  docker exec -it test-app pkill -x test
  ```

## Logs
- **monitor.sh log**:
  ```bash
  docker exec -it test-app tail -f /var/log/monitoring.log
  ```
- **nginx access log**:
  ```bash
  docker exec -it test-server tail -f /var/log/nginx/api_access.log
  ```

## Notes
- `Supervisor` is used instead of systemd in `test-app` to manage `monitor.sh`.
- `test` process is not started by default. Start it manually if needed.
