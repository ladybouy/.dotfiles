#include "config.h"

#include "block.h"
#include "util.h"

// clang-format off
Block blocks[] = {
    {"mpdstatus.sh",       1,      1 },
    {"wxstatusbar.sh",     1,      2 },
    {"internet.sh",        1,      3 },
    {"volume.sh",          1,      4 },
    {"calendar.sh",        60,     5 },
    {"time.sh",            1,      6 },
};
// clang-format on

const unsigned short blockCount = LEN(blocks);
