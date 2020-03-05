#!/usr/bin/env python3
import sys
from datetime import datetime

from chibi.file import Chibi_file, Chibi_path
from chibi_command.mpd import MPC


path = Chibi_path( __file__ )

f = Chibi_file( path + "cd_events" )
date = datetime.utcnow()

event = ",".join( sys.argv[1:] )

final_even = "{}\t{}\n".format( date.isoformat(), event )

f.append( final_even )

event = tuple( event.split() )

if event[1] == 'CDPLAY':
    MPC.play_toggle()

if event[1] == 'CDSTOP':
    MPC.stop()

if event[1] == 'CDNEXT':
    MPC.next()

if event[1] == 'CDPREV':
    MPC.prev()
