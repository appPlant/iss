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

def env_for(path, query = '')
  { 'REQUEST_METHOD' => 'GET', 'PATH_INFO' => path, 'QUERY_STRING' => query }
end

def fixture(file)
  File.read File.join(File.dirname(__FILE__), "fixtures/#{file}.json").chomp
end

assert 'GET /api/jobs' do
  code, headers, body = app.call env_for('/api/jobs')

  assert_equal 200, code
  assert_include headers['Content-Type'], 'application/json'
  assert_equal fixture('jobs'), body[0]
end

# assert 'GET /api/jobs/reports' do
#   code, headers, body = app.call env_for('/api/jobs/showver/reports')
#
#   assert_equal 200, code
#   assert_include headers['Content-Type'], 'application/json'
#   assert_equal fixture('reports'), body[0]
# end

assert 'GET /api/jobs/reports', 'missing reports sub folder' do
  code, headers, body = app.call env_for('/api/jobs/hostname/reports')

  assert_equal 200, code
  assert_include headers['Content-Type'], 'application/json'
  assert_equal '[]', body[0]
end

assert 'GET /api/jobs/reports', 'missing job' do
  code, = app.call env_for('/api/jobs/reports')

  assert_equal 404, code
end

# assert 'GET /api/jobs/reports', 'unknown job' do
#   code, = app.call env_for('/api/jobs/123/reports')
#
#   assert_equal 404, code
# end
