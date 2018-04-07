role :app, %w{vagrant@192.168.23.22}

server '192.168.23.22',
   roles: %w(app),
   ssh_options: {
     user: 'vagrant',
     forward_agent: true,
     auth_methods: %w(publickey password),
     password: 'vagrant'
   }
