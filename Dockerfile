FROM --platform=linux/amd64 ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive 

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y build-essential curl git python3 qt5-qmake qtbase5-dev

# Download and setup the reMarkable Codex toolchain
RUN curl -s -L https://storage.googleapis.com/remarkable-codex-toolchain/codex-x86_64-cortexa7hf-neon-rm11x-toolchain-3.1.15.sh -o installer.sh && \
    chmod +x installer.sh && \
    ./installer.sh -y && \
    rm installer.sh

# Set the working directory
WORKDIR /mnt/RemarkableLamyEraser/

# Copy the project files into the container
COPY ./ ./

CMD ["/bin/bash", "-c", "source /opt/codex/rm11x/3.1.15/environment-setup-cortexa7hf-neon-remarkable-linux-gnueabi && make clean && make"]