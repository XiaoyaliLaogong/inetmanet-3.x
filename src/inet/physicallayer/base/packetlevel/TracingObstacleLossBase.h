//
// Copyright (C) 2013 OpenSim Ltd.
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//

#ifndef __INET_TRACINGOBSTACLELOSS_H
#define __INET_TRACINGOBSTACLELOSS_H

#include "inet/environment/contract/IPhysicalObject.h"
#include "inet/physicallayer/contract/packetlevel/IObstacleLoss.h"

namespace inet {

namespace physicallayer {

using namespace inet::physicalenvironment;

class INET_API TracingObstacleLossBase : public cModule, public IObstacleLoss
{
  public:
    class ObstaclePenetratedEvent : public cObject
    {
      public:
        const IPhysicalObject *object;
        const Coord intersection1;
        const Coord intersection2;
        const Coord normal1;
        const Coord normal2;

      public:
        ObstaclePenetratedEvent(const IPhysicalObject *object, Coord intersection1, Coord intersection2, Coord normal1, Coord normal2);
    };

  public:
    static simsignal_t obstaclePenetratedSignal;
};

} // namespace physicallayer

} // namespace inet

#endif // ifndef __INET_TRACINGOBSTACLELOSS_H
