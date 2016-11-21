# docker-rancher-reset-host-ip
Updates rancher host IP on any instance (if machine has more than 1 public ip, whichver one is used for outbound requests will be used)
## docker run command
`docker run --rm  -v /var/run/docker.sock:/var/run/docker.sock -it getapp/rancher-reset-host-ip`
## docker-compose
```
update-host-ip:
  log_driver: ''
  labels:
    io.rancher.scheduler.global: 'true'
    io.rancher.container.pull_image: always
    io.rancher.container.start_once: 'true'
  tty: true
  log_opt: {}
  image: siosphere/rancher-reset-host-ip
  volumes:
  - /var/run/docker.sock:/var/run/docker.sock
  stdin_open: true
```
