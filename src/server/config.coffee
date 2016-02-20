###
Copyright (c) 2014, Groupon
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.###

fs = require "fs"

module.exports = try
  @conf = JSON.parse fs.readFileSync("#{__dirname}/../../config.json")
  
  config.couch.db = if process.env.COUCH_DB then process.env.COUCH_DB else config.couch.db
  config.couch.host = if process.env.COUCH_HOST then process.env.COUCH_HOST else config.couch.host
  config.couch.port = if process.env.COUCH_PORT then process.env.COUCH_PORT else config.couch.port
  config.couch.user = if process.env.COUCH_USER then process.env.COUCH_USER else config.couch.user
  config.couch.pass = if process.env.COUCH_PASS then process.env.COUCH_PASS else config.couch.pass
  
  config.server.port = if process.env.PORT then process.env.PORT else config.server.port

  @conf
catch e
  console.warn "Error loading config.json", e
  {}
