# Apache 2.0 License
#
# Copyright (c) Copyright 2016 Sebastian Katzer, appPlant GmbH
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

def env_for(path, query = '')
  { 'REQUEST_METHOD' => 'GET', 'PATH_INFO' => path, 'QUERY_STRING' => query }
end

Yeah.run_initializers(@initializers)
app = Shelf::Server.new.build_app(app())

assert 'GET /', 'redirects to iss/index.html' do
  code, headers, = app.call env_for('/')

  assert_equal 303, code
  assert_equal '/iss/index.html', headers['Location']
end

assert 'GET /index.html', 'redirects to iss/index.html' do
  code, headers, = app.call env_for('/index.html')

  assert_equal 303, code
  assert_equal '/iss/index.html', headers['Location']
end

assert 'GET /iss/index.html' do
  code, _, body = app.call env_for('/iss/index.html')

  assert_equal 200, code
  assert_equal '<html>Yeah!</html>', body[0]
end
