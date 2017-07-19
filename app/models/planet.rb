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

class Planet
  # Private Initializer for a planet by id.
  #
  # @param [ String ] id The planet id.
  #
  # @return [ Planet ]
  def initialize(id, name, type)
    @id   = id
    @name = name
    @type = type
    @ski  = Ski.new
  end

  attr_reader :id, :name, :type

  # List of reports associated to the planet.
  #
  # @return [ Array<Hash> ]
  def logfiles
    @ski.raw_logfile_list(@id).map do |f|
      tokens = f.split('/')
      Logfile.new(f, @id, tokens[tokens.length - 1])
    end
  end

  # Returns specified logfile
  #
  # @return [ Logfile ]
  def logfile(file_name)
    tokens = file_name.split('/')
    Logfile.new(file_name, @id, tokens[tokens.length - 1])
  end

  # Converts the planet into a hash struct.
  #
  # @return [ Hash ]
  def to_h
    {
      id: @id,
      name: @name,
      type: @type
    }
  end
end
