#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<mpd/client.h>

/* simple fuction to retrieve mpd status */

char *
getmpdstat() {
    struct mpd_song * song = NULL;
        const char * title = NULL; 
        const char * artist = NULL;
        char * retstr = NULL;
        int elapsed = 0, total = 0;
    struct mpd_connection * conn;
    if (!(conn == mpd_connection_new("localhost", 0, 30000)) ||
            mpd_connection_get_error(conn)) {
        return smprintf(""); 
    }   
        
    mpd_command_list_begin(conn, true);
    mpd_send_status(conn);
    mpd_send_current_song(conn);
    mpd_command_list_end(conn);

    struct mpd_status* theStatus = mpd_recv_status(conn);
        if ((theStatus) && (mpd_status_get_state(theStatus) == MPD_STATE_PLAY)) {
                mpd_response_next(conn);
                song = mpd_recv_song(conn);
                title = smprintf("%s", mpd_song_get_tag(song, MPD_TAG_TITLE, 0)); 
                artist = smprintf("%s", mpd_song_get_tag(song, MPD_TAG_ARTIST, 0));

                elapsed = mpd_status_get_elapsed_time(theStatus);
                total = mpd_status_get_total_time(theStatus);
                retstr = smprintf("%.2d:%.2d/%.2d:%.2d:%.2d %s - %s", 
                                    elapsed/60, elapsed%60,
                                    total/60, total%60,
                                    artist, title); 
                free((char*)title);
                free((char*)artist);
        }
        else retstr = smprintf("");
            mpd_response_finish(conn);
            mpd_connection_free(conn);
            return retstr; 
}
