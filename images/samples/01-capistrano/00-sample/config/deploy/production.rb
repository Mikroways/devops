role :demo, %w{localhost}

server '192.168.222.22',
   roles: %w(demo),
   ssh_options: {
     user: 'vagrant',
     forward_agent: true,
     auth_methods: %w(publickey password),
     password: 'vagrant'
   }
