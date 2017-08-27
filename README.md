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

## Quickstart

1. Get code with [justgo]() (preferred) or by checking this repo out, locally.
2. Build project and start inside a container: 

    ```
    > make
    ```

3. Check logs to verify things are running properly:

    ```
    > make logs
    ```

    If you see `Application starting up...` as the last entry in the log
    things should be A-OK. 

4. Find the port the server attached to by running:

   ```
   > make ps
   ```

   which will have an output that looks something like 

   ```
     Name                   Command               State            Ports
   --------------------------------------------------------------------------------
   ms-helloworld   CompileDaemon -build=scrip ...   Up      0.0.0.0:32770->3737/tcp
   ```

   Whatever you see instead of `0.0.0.0:32770` is the host/port that your
   microservice started at. Type it in your browser or Postman or another
   HTTP client of your choice to verify that the service is responding.

## Usage

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
> make dep-update package=github.com/gorilla/mux

# update all dependencies
> make dep-update-all

```

## License 

[MIT](LICENSE)