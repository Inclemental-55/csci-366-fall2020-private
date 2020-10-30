//
// Created by carson on 5/20/20.
//

#include "stdio.h"
#include "stdlib.h"
#include "server.h"
#include "char_buff.h"
#include "game.h"
#include "repl.h"
#include "pthread.h"
#include <string.h>    //strlen
#include<sys/socket.h>
#include<arpa/inet.h>    //inet_addr
#include<unistd.h>    //write

static game_server *SERVER;

void init_server() {
    if (SERVER == NULL) {
        SERVER = calloc(1, sizeof(struct game_server));
    } else {
        printf("Server already started");
    }
}

int handle_client_connect(int player) {
    // STEP 9 - This is the big one: you will need to re-implement the REPL code from
    // the repl.c file, but with a twist: you need to make sure that a player only
    // fires when the game is initialized and it is there turn.  They can broadcast
    // a message whenever, but they can't just shoot unless it is their turn.
    //
    // The commands will obviously not take a player argument, as with the system level
    // REPL, but they will be similar: load, fire, etc.
    //
    // You must broadcast informative messages after each shot (HIT! or MISS!) and let
    // the player print out their current board state at any time.
    //
    // This function will end up looking a lot like repl_execute_command, except you will
    // be working against network sockets rather than standard out, and you will need
    // to coordinate turns via the game::status field.
}

void server_broadcast(char_buff *msg) {
    // send message to all players
    if (SERVER != NULL && msg != NULL) {
        for (int i = 0; i < sizeof(SERVER->player_sockets); i++) {
            if (SERVER->player_sockets[i] != 0 && SERVER->player_threads[i] != 0) {
                send(SERVER->player_sockets[i], msg, sizeof(&msg), 0);
            }
        }
    }
}

int run_server() {
    // STEP 8 - implement the server code to put this on the network.
    // Here you will need to initalize a server socket and wait for incoming connections.
    //
    // When a connection occurs, store the corresponding new client socket in the SERVER.player_sockets array
    // as the corresponding player position.
    //
    // You will then create a thread running handle_client_connect, passing the player number out
    // so they can interact with the server asynchronously
    if (SERVER != NULL) {
        int server_socket_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
        if (server_socket_fd == -1)
            printf("Could not create socket\n");
        else {
            int yes = 1;
            setsockopt(server_socket_fd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes));

            struct sockaddr_in server;
            server.sin_family = AF_INET;

            server.sin_addr.s_addr = INADDR_ANY;
            server.sin_port = htons(9876);

            if (bind(server_socket_fd, (struct sockaddr *) &server, sizeof(server)) < 0) {
                puts("Bind failed");
            } else {
                puts("Bind worked!");
                listen(server_socket_fd, 2);

                puts("Waiting for incoming connections...");

                struct sockaddr_in client;
                socklen_t size_from_connect;
                int client_socket_fd;

                while ((client_socket_fd = accept(server_socket_fd,
                                                  (struct sockaddr *) &client,
                                                  &size_from_connect)) > 0) {

                    int playerNum = (SERVER->player_sockets[0] == 0) ? 0 : 1;
                    if (SERVER->player_sockets[playerNum] == 0 && SERVER->player_threads[playerNum == 0]) {
                        SERVER->player_sockets[playerNum] = client_socket_fd;
                        pthread_create(&SERVER->player_threads[playerNum], NULL, handle_client_connect, playerNum);
                    } else {
                        puts("Player already connected on this socket");
                    }
                }
            }
        }
    }
}

int server_start() {
    // STEP 7 - using a pthread, run the run_server() function asynchronously, so you can still
    // interact with the game via the command line REPL
    init_server();
    if (SERVER->server_thread == 0)
        pthread_create(&SERVER->server_thread, NULL, run_server, NULL);
    else
        printf("Server Thread Already Running!");
}
