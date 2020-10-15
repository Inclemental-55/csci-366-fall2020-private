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
    unsigned long long int fireBitMask = xy_to_bitval(x, y);
    if (fireBitMask != 0 && game != NULL) {
        int opponentPlayer = (player == 0) ? 1 : 0; //update the player's 'shots' value
        game->players[player].shots ^= fireBitMask; //check if its a hit.
        unsigned long long int opponentsShips = game->players[opponentPlayer].ships;
        if ((opponentsShips ^ fireBitMask) < opponentsShips) { //hit
            game->players[player].hits ^= fireBitMask;
            game->players[opponentPlayer].ships ^= fireBitMask;
            if (opponentsShips == 0ull && player == 0)
                game->status = PLAYER_0_WINS;
            else if (opponentsShips == 0ull && player == 1)
                game->status = PLAYER_1_WINS;
            return 1; //caboom
        } else //miss!
            return 0;
    } else  //invalid
        return 0;

}


unsigned long long int xy_to_bitval(int x, int y) {
    // Step 1 - implement this function.  We are taking an x, y position
    // and using bitwise operators, converting that to an unsigned long long
    // with a 1 in the position corresponding to that x, y
    //
    // x:0, y:0 == 0b00000...0001 (the one is in the first position)
    // x:1, y: 0 == 0b00000...10 (the one is in the second position)
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
    if (spec != NULL && strlen(spec) == 15) { //check for nullity and correct length
        unsigned long long int originalBoard = game->players[player].ships; //our original board
        char ships[] = {'c', 'b', 'd', 's', 'p'}; //acceptable ships
        int lengths[] = {5, 4, 3, 3, 2}; //acceptable lengths
        char usedShips[5] = {};
        for (int i = 0; i < 15; i += 3) {
            int length;
            for (int z = 0; z < sizeof(ships); z++) { //check if it is a valid ship, and get the length of the ship
                if (sizeof(usedShips) >= z && tolower(spec[i]) == tolower(usedShips[z]))  //check for duplicate ships
                    return -1;
                if (tolower(spec[i]) == ships[z]) { //find the ship and get its length
                    length = lengths[z];
                    break;
                } else if (z == sizeof(ships) - 1)  //if we have reached the end it was not valid, return -1
                    return -1;
            }
            strncat(usedShips, &spec[i], 1); //add the new ship to used ships
            int result; //storage for our result
            result = (spec[i] >= 'A' && spec[i] <= 'Z') ? //if its cap, we do horizontal.
                     add_ship_horizontal(&game->players[player], ((int) spec[i + 1] - '0'), ((int) spec[i + 2] - '0'),
                                         length) :
                     add_ship_vertical(&game->players[player], ((int) spec[i + 1] - '0'), ((int) spec[i + 2] - '0'),
                                       length);
            if (result == -1) { //if we get a -1 returned, reset the board and return a -1
                game->players[player].ships = originalBoard;
                return -1;
            }
        }
        return 1; //success! return 1
    } else
        return -1;
}

/**
 * Adds a ship horizontally to the gameboard. Implemented recursively.
 * @param player Player struct
 * @param x X loc of the ship
 * @param y Y loc of the ship
 * @param length Current length of the ship left to implement
 * @return 1 if successful, -1 otherwise
 */
int add_ship_horizontal(player_info *player, int x, int y, int length) {
    // implement this as part of Step 2
    // returns 1 if the ship can be added, -1 if not
    // hint: this can be defined recursively
    if (length == 0)
        return 1;
    if ((player->ships ^ xy_to_bitval(x, y)) > player->ships) {  //check for overlapping ships.
        player->ships ^= xy_to_bitval(x, y);
        return add_ship_horizontal(player, ++x, y, --length);
    } else //overlapping ships
        return -1;

}

/**
 * Adds a ship vertically, implemented using recursion.
 * @param player Player struct
 * @param x X loc of the ship
 * @param y Y loc of the ship
 * @param length The current length left to add of the ship
 * @return 1 if successful, -1 if not successful
 */
int add_ship_vertical(player_info *player, int x, int y, int length) {
    // implement this as part of Step 2
    // returns 1 if the ship can be added, -1 if not
    // hint: this can be defined recursively
    if (length == 0)
        return 1;
    if ((player->ships ^ xy_to_bitval(x, y)) > player->ships) { //check for overlapping ships
        player->ships ^= xy_to_bitval(x, y);
        return add_ship_vertical(player, x, ++y, --length);
    } else //overlapping ships
        return -1;
}