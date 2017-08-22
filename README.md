# justgo-microservice

Microservice Template for JustGo (https://git.justgo.rocks)

Skeleton project for jump-starting a Go-powered microservice development with
Docker, code hot-reloading and Go best-practices.

The only requirement for running this project is a properly set-up Docker
environment and (optionally) GNU make. You can also run commands in the 
Makefile manually (they are simple), if you don't have make.

**ATTENTION:** this setup assumes that the code is always executed inside
a Docker container and is not meant for running code on the host machine
directly. 

To learn more: [https://justgo.rocks](https://justgo.rocks)


## USAGE

```
# run:
> make [start]

# stop:
> make stop

# follow logs:
> make logs

# show container status:
> make ps

# jump into the Docker container
> make shell

# add a dependency:
> make dep-add package=github.com/gorilla/mux

# update a dependency
> make dep-up package=github.com/gorilla/mux

# update all dependencies
> make dep-up-all

```

## License 

[MIT](LICENSE)