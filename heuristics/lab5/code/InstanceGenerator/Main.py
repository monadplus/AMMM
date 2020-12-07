'''
AMMM P2 Instance Generator v2.0
Main function.
Copyright 2020 Luis Velasco.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''

import sys
import os
from Heuristics.datParser import DATParser
from AMMMGlobals import AMMMException
from ValidateConfig import ValidateConfig
from InstanceGenerator import InstanceGenerator

def run():
    path = "config/"
    for configFile in os.listdir(path):
        try:
                fp = os.path.join(path + configFile)
                print("Reading Config file %s..." % fp)
                config = DATParser.parse(fp)
                ValidateConfig.validate(config)
                instGen = InstanceGenerator(config)
                instGen.generate()
        except AMMMException as e:
                print("Exception: %s", e)
                return 1
    print("Done!")
    return 0

if __name__ == '__main__':
    sys.exit(run())
