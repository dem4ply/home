#!/usr/bin/env python3
import sys
from datetime import datetime

from chibi_command.mpd import MPC
from chibi.file import Chibi_file, Chibi_path


path = Chibi_path( __file__ )

f = Chibi_file( path + "headphone_events" )
date = datetime.utcnow()

event = ",".join( sys.argv[1:] )

final_even = "{}\t{}\n".format( date.isoformat(), event )

f.append( final_even )

event = tuple( event.split() )

if event[-1] == 'plug':
    MPC.play()

if event[-1] == 'unplug':
    MPC.pause()
