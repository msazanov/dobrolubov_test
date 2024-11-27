#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

void handle_signal(int signal) {
    exit(0);
}

int main() {
    signal(SIGTERM, handle_signal);
    signal(SIGINT, handle_signal);

    while (1) {
        pause();
    }

    return 0;
}
