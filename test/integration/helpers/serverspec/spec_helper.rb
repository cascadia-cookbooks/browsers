require 'serverspec'

set :backend, :exec

set :path, '/usr/bin:/sbin:/usr/local/sbin:/usr/sbin:$PATH'
