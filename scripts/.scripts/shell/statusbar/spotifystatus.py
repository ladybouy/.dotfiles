#!/usr/bin/python
import dbus

ICON_COLOR="^c#d79921^"
ICON=""
TEXT_COLOR="^d^"

try:
    bus = dbus.SessionBus()
    spotify = bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
    spotify_iface = dbus.Interface(spotify, 'org.freedesktop.DBus.Properties')
    props = spotify_iface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    print(ICON_COLOR+ICON+TEXT_COLOR + " "+ str(props['xesam:artist'][0]) + " - " + str(props['xesam:title']))
except dbus.exceptions.DBusException:
    exit
