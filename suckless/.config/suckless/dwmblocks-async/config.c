#include "config.h"

#include "block.h"
#include "util.h"

// clang-format off
Block blocks[] = {
    {"mpdstatus.sh",       1,      6 }, // There is a bug with this script
    {"spotifystatus.sh",   1,      5 },
    {"internet.sh",        1,      4 },
    {"volume-pipewire.sh", 1,      3 },
    {"calendar.sh",        60,     2 },
    {"time.sh",            1,      1 },
};
// clang-format on

const unsigned short blockCount = LEN(blocks);
