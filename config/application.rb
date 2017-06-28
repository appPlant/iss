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

raise '$ORBIT_HOME not set' unless ENV['ORBIT_HOME']
raise '$ORBIT_FILE not set' unless ENV['ORBIT_FILE']

ORBIT_HOME     = ENV['ORBIT_HOME']
ORBIT_FILE     = JSON.parse(IO.read(ENV['ORBIT_FILE']))
JOBS_FOLDER    = File.join(ORBIT_HOME, 'jobs').freeze
REPORTS_FOLDER = File.join(ORBIT_HOME, 'reports').freeze

CONFIG_FOLDER  = File.join(ORBIT_HOME, 'config').freeze
CONFIG_FILE    = JSON.parse(IO.read(File.join(CONFIG_FOLDER, 'logfile_config.json')))

# Folder where to find all static assets, e.g. the web app
document_root File.join(ORBIT_HOME, 'public'), urls: ['/iss']
# Folder where to write logs
log_folder File.join(ORBIT_HOME, 'logs'), 'iss.log'