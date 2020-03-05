#!/usr/bin/env python3

from chibi.config import basic_config
from chibi.command.nmap import nmap
from chibi.command.network import ip_addr
from argparse import ArgumentParser
from chibi.atlas import Chibi_atlas


basic_config()
parser = ArgumentParser()
parser.add_argument(
    "-i", "--interfacce", dest="interface", default='all',
    help="interface de red que va a usar para escanear default: (all)" )

parser.add_argument(
    "-s", dest="scan_mode", default='sn',
    help="modo de escaneo de nmap default ( sn )" )

args = parser.parse_args()


def main():
    interfaces = ip_addr()
    if args.interface == 'all':
        interfaces_to_use = list( interfaces.keys() )
    else:
        if ',' in args.interface:
            interfaces_to_use = map(
                lambda x: x.strip(), args.interface.split( ',' ))
        else:
            interfaces_to_use = [ args.interface ]

    for current_interface in interfaces_to_use:
        interface = interfaces[ current_interface ]
        if current_interface == 'lo' or not interface.ip_v4:
            continue
        nmap_result = nmap( "-{}".format( args.scan_mode ), interface.ip_v4 )
        print( "interface: {}\tcommand: {}".format(
            current_interface, nmap_result.nmaprun.args ) )
        for result in nmap_result.nmaprun.host:
            result = Chibi_atlas( result )
            if 'address' not in result:
                import pdb
                pdb.set_trace()
            if isinstance( result.address, list ):
                if len( result.address ) > 2:
                    import pdb
                    pdb.set_trace()
                ip = result.address[0]
                mac = result.address[1]
                if len( mac ) > 2:
                    import pdb
                    pdb.set_trace()
                if 'vendor' in mac:
                    mac = f"{mac.addr}\t{mac.vendor}"
                else:
                    mac = f"{mac.addr}"
                o = f"\tip: {ip.addr}\tmac: {mac}"
            else:
                o = '\tip: {}'.format( result.address.addr )
            if result.hostnames:
                o += "\thostname: {} ( {} )".format(
                    result.hostnames.hostname.name,
                    result.hostnames.hostname.type )
            print( o )



if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        import pdb
        pdb.set_trace()
        logger.exception( "unhandled exception" )
