//
// Created by carson on 5/20/20.
//

#include <stdlib.h>
#include <stdio.h>
#include "game.h"
#include <limits.h>
#include <memory.h>
#include <ctype.h>

// STEP 10 - Synchronization: the GAME structure will be accessed by both players interacting
// asynchronously with the server.  Therefore the data must be protected to avoid race conditions.
// Add the appropriate synchronization needed to ensure a clean battle.

static game *GAME = NULL;

void game_init() {
    if (GAME) {
        free(GAME);
    }
    GAME = malloc(sizeof(game));
    GAME->status = CREATED;
    game_init_player_info(&GAME->players[0]);
    game_init_player_info(&GAME->players[1]);
}

void game_init_player_info(player_info *player_info) {
    player_info->ships = 0;
    player_info->hits = 0;
    player_info->shots = 0;
}

void printbits(unsigned long n) {
    unsigned long i;
    i = 1UL << (sizeof(n) * CHAR_BIT - 1);
    int counter = 0;
    while (i > 0) {
        if (n & i)
            printf("1");
        else
            printf("0");
        i >>= 1;
        counter++;
        if (counter == 8) {
            printf(".");
            counter = 0;
        }
    }
    printf("\n");
}

int game_fire(game *game, int player, int x, int y) {
    // Step 5 - This is the crux of the game.  You are going to take a shot from the given player and
    // update all the bit values that store our game state.
    //
    //  - You will need up update the players 'shots' value
    //  - you You will need to see if the shot hits a ship in the opponents ships value.  If so, record a hit in the
    //    current players hits field
    //  - If the shot was a hit, you need to flip the ships value to 0 at that position for the opponents ships field
    //
    //  If the opponents ships value is 0, they have no remaining ships, and you should set the game state to
    //  PLAYER_1_WINS or PLAYER_2_WINS depending on who won.
}


unsigned long long int xy_to_bitval(int x, int y) {
    // Step 1 - implement this function.  We are taking an x, y position
    // and using bitwise operators, converting that to an unsigned long long
    // with a 1 in the position corresponding to that x, y
    //
    // x:0, y:0 == 0b1 (the one is in the first position)
    // x:1, y: 0 == 0b10 (the one is in the second position)
    // ....
    // x:0, y: 1 == 0b100000000 (the one is in the eighth position)
    //
    // you will need to use bitwise operators and some math to produce the right
    // value.
    return (x > 7 | y > 7 | x < 0 | y < 0) ? 0 : (1ull << (x + (y * 8)));
}

struct game *game_get_current() {
    return GAME;
}

int game_load_board(struct game *game, int player, char *spec) {
    // Step 2 - implement this function.  Here you are taking a C
    // string that represents a layout of ships, then testing
    // to see if it is a valid layout (no off-the-board positions
    // and no overlapping ships)
    //
    // if it is valid, you should write the corresponding unsigned
    // long long value into the Game->players[player].ships data
    // slot and return 1
    //
    // if it is invalid, you should return -1
    unsigned long long int originalBoard = game->players[player].ships;
    char ships[] = {'c', 'C', 'b', 'B', 'd', 'D', 's', 'S', 'p', 'P'};
    int lengths[] = {5, 5, 4, 4, 3, 3, 3, 3, 2, 2};
    char usedShips[5] = {};


    if (spec != NULL && strlen(spec) == 15) {
        printf("%s\n", spec);
        for (int i = 0; i < 15; i += 3) {
            printf("Looking at a new ship!: %c\n", spec[i]);
            printf("%s\n", spec);
            bool mybool = false;
            for (int z = 0; z < sizeof(ships); z++) { //check if it is a valid ship
                if (spec[i] == ships[z]) {
                    mybool = true;
                    break;
                }
            }
            int lengthloc = -1;
            for (int t = 0; t < sizeof(ships); t++) {
                if (ships[t] == spec[i]) {
                    lengthloc = t;
                }
            }
            for (int u = 0; u < sizeof(usedShips); u++) {
                switch (spec[i]) {
                    case 'C':
                    case 'c' :
                        if (usedShips[u] == 'c' || usedShips[u] == 'C') {
                            mybool = false;
                        }
                        break;
                    case 'D':
                    case 'd' :
                        if (usedShips[u] == 'd' || usedShips[u] == 'D') {
                            mybool = false;
                        }
                        break;
                    case 'B':
                    case 'b' :
                        if (usedShips[u] == 'b' || usedShips[u] == 'B') {
                            mybool = false;
                        }
                        break;
                    case 'S':
                    case 's' :
                        if (usedShips[u] == 's' || usedShips[u] == 'S') {
                            mybool = false;
                        }
                        break;
                    case 'P':
                    case 'p' :
                        if (usedShips[u] == 'p' || usedShips[u] == 'P') {
                            mybool = false;
                        }
                        break;
                }

            }
            if (mybool) {
                strncat(usedShips, &spec[i],1);
                int result;
                if (spec[i] >= 'A' && spec[i] <= 'Z') {
                    result = add_ship_horizontal(&game->players[player], ((int) spec[i + 1] - '0'),
                                                 ((int) spec[i + 2] - '0'),
                                                 lengths[lengthloc]);
                } else {
                    result = add_ship_vertical(&game->players[player], ((int) spec[i + 1] - '0'),
                                               ((int) spec[i + 2] - '0'),
                                               lengths[lengthloc]);
                }
                if (result == -1) {
                    game->players[player].ships = originalBoard;
                    return -1;
                }
            } else {
                game->players[player].ships = originalBoard;
                return -1;
            }
        }
        return 1;
    } else
        return -1;
}

int add_ship_horizontal(player_info *player, int x, int y, int length) {
    // implement this as part of Step 2
    // returns 1 if the ship can be added, -1 if not
    // hint: this can be defined recursively
    if (length == 0)
        return 1;
    else {
        if (x > -1 && y > -1 && x < 8 && y < 8) {
            unsigned long long int ships = player->ships, mask = xy_to_bitval(x, y);
            if ((ships ^ xy_to_bitval(x, y)) > ships) {
                player->ships = player->ships ^ mask;
                return add_ship_horizontal(player, ++x, y, --length);
            } else
                //overlapping ships
                return -1;
        } else
            return -1;
    }

}

int add_ship_vertical(player_info *player, int x, int y, int length) {
    // implement this as part of Step 2
    // returns 1 if the ship can be added, -1 if not
    // hint: this can be defined recursively
    if (length == 0)
        return 1;
    else {
        if (x > -1 && y > -1 && x < 9 && y < 9) {
            unsigned long long int ships = player->ships, mask = xy_to_bitval(x, y);
            if ((ships ^ xy_to_bitval(x, y)) > ships) {
                player->ships = player->ships ^ mask;
                return add_ship_vertical(player, x, ++y, --length);
            } else
                //overlapping ships
                return -1;

        } else
            return -1;
    }

}