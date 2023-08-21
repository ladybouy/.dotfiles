#include "config.h"

#include "block.h"
#include "util.h"

// clang-format off
Block blocks[] = {
    {"mpdstatus.sh",       1,      2 },
    {"spotifystatus.sh",   1,      1 },
    {"wxstatusbar.sh",     60,     3 },
    {"internet.sh",        1,      4 },
    {"volume.sh",          1,      5 },
    {"calendar.sh",        60,     6 },
    {"time.sh",            1,      7 },
    {"echo ' '",          1,      8 },
};
// clang-format on

const unsigned short blockCount = LEN(blocks);
