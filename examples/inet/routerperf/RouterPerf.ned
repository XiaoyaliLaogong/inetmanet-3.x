//
// Copyright (C) 2000 Institut fuer Telematik, Universitaet Karlsruhe
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//

package inet.examples.inet.routerperf;

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.Router;


network RouterPerfNetwork
{
    parameters:
        int nodeNo;
    types:
        channel C extends ThruputMeteringChannel
        {
            thruputDisplayFormat = "u";
        }
    submodules:
        configurator: IPv4NetworkConfigurator {
            parameters:
                @display("p=61,163");
        }
        sender[nodeNo]: BurstHost {
            parameters:
                @display("p=100,300,row,100");
        }
        recip[nodeNo]: BurstHost {
            parameters:
                @display("p=100,80,row,100");
        }
        router: Router {
            parameters:
                @display("p=210,190");
        }
    connections:
        for i=0..nodeNo-1 {
            sender[i].pppg++ <--> C {  datarate = 1Mbps; } <--> router.pppg++;
            recip[i].pppg++ <--> C {  datarate = 1Mbps; } <--> router.pppg++;
        }
}

