#
# Copyright (c) 2016 by appPlant GmbH. All rights reserved.
#
# @APPPLANT_LICENSE_HEADER_START@
#
# This file contains Original Code and/or Modifications of Original Code
# as defined in and that are subject to the Apache License
# Version 2.0 (the 'License'). You may not use this file except in
# compliance with the License. Please obtain a copy of the License at
# http://opensource.org/licenses/Apache-2.0/ and read it before using this
# file.
#
# The Original Code and all software distributed under the License are
# distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
# EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
# INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
# Please see the License for the specific language governing rights and
# limitations under the License.
#
# @APPPLANT_LICENSE_HEADER_END@

class LFVController < Yeah::Controller
  # Render a list of all log files.
  #
  # @param [ String ] planet_id The ID of the planet where to look for.
  #
  # @return [ Void ]
  def files(planet_id)
    planet = Planet.find(planet_id)
    planet ? render(json: planet.logfile_list.map!(&:to_h)) : render(400)
  end

  # Render the content of a log file.
  #
  # @param [ String ] planet_id The ID of the planet where to look for.
  # @param [ String ] file_path   The id or path of the file to render.
  #
  # @return [ Void ]
  def file(planet_id)
    file_id = params['file_id']
    planet  = Planet.find(planet_id)
    logfile = planet.logfile(file_id) if planet
    logfile ? render(json: logfile.map!(&:to_h)) : render(401)
  end
end