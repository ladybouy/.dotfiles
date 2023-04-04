#include "config.h"

#include "block.h"
#include "util.h"

// clang-format off
Block blocks[] = {
    {"mpdstatus.sh",   1,      2 },
    {"internet.sh",    1,      1 },
    {"volume.sh",   1,      3 },
    {"calendar.sh", 60,     3 },
    {"time.sh",     1,      3 },
};
// clang-format on

const unsigned short blockCount = LEN(blocks);
