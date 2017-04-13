# RSpec on Ubuntu 16.04 LTS (Xenial Xerus)

Very simple image to use as the environment for running [RSpec tests](http://rspec.info/) against newly built Docker images.

## Usage

Run the this image with the following:
1. The docker soccket mounted at /var/run/docker.sock
2. A volume containing the tests you want to run (default mount point of /mnt/)
3. An environment varialbe called IMAGE containing the name of the docker image to test
4. The exact rspec command to run

```bash
FOLDER_WITH_TESTS="$(pwd)"
NAME_OF_IMAGE_TO_TEST="1and1internet/ubuntu-16-rspec"
RSPEC_CMD_TO_RUN="rspec -f documentation spec/spec_helper.rb"

docker run -i -t --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${FOLDER_WITH_TESTS}:/mnt/ -e IMAGE=${NAME_OF_IMAGE_TO_TEST} -i -t 1and1internet/ubuntu-16-rspec ${RSPEC_CMD_TO_RUN}
```

## Building and Self testing

```bash
git clone https://github.com/1and1internet/ubuntu-16-rspec.git
cd ubuntu-16-rspec

IMAGE="ubuntu-16-rspec"
FOLDER_WITH_TESTS="$(pwd)"
NAME_OF_IMAGE_TO_TEST="${IMAGE}"
RSPEC_CMD_TO_RUN="rspec -f documentation spec/spec_helper.rb"

docker build --pull --rm --tag ${IMAGE} .
docker run --rm -i -t -v /var/run/docker.sock:/var/run/docker.sock -v ${FOLDER_WITH_TESTS}:/mnt/ -e IMAGE=${NAME_OF_IMAGE_TO_TEST} ${IMAGE} ${RSPEC_CMD_TO_RUN}
```


