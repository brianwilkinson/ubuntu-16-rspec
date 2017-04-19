# RSpec on Ubuntu 16.04 LTS (Xenial Xerus)

Very simple image to use as the environment for running [RSpec tests](http://rspec.info/) against newly built Docker images.

## Usage

Run the this image with the following:
1. The docker soccket mounted at `/var/run/docker.sock`
2. A volume containing the tests you want to run (default mount point of /mnt/)
3. The command to run, i.e. `rspec`

### Example - generic rspec usage


```bash
FOLDER_WITH_TESTS="$(pwd)"
RSPEC_IMAGE="1and1internet/ubuntu-16-rspec"
CMD_TO_RUN="rspec"

docker run -i -t --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${FOLDER_WITH_TESTS}:/mnt/ ${RSPEC_IMAGE} ${CMD_TO_RUN}
```

### Example - using Makefile from this repository

```bash
FOLDER_WITH_TESTS="$(pwd)"
RSPEC_IMAGE="1and1internet/ubuntu-16-rspec"
CMD_TO_RUN="make do-test IMAGE_NAME=${RSPEC_IMAGE}"

docker run -i -t --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${FOLDER_WITH_TESTS}:/mnt/ ${RSPEC_IMAGE} ${CMD_TO_RUN}
```

## Building and testing

A simple Makefile is included for your convience. It assumes a linux environment with a docker socket avialable at `/var/run/docker.sock`

To build and test just run `make`.
You can also just `make pull`, `make build` and `make test` separately.

Please see the top of the Makefile for various variables which you may choose to customise. Variables may be passed as arguments, e.g. `make IMAGE_NAME=bob` or `make build BUILD_ARGS="--rm --no-cache"`
