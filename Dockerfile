FROM ubuntu:20.04

# Update and install necessary packages
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && \
    apt-get install -y build-essential curl git python3

# Download and setup the reMarkable Codex toolchain
RUN DEBIAN_FRONTEND="noninteractive" curl -s -L https://storage.googleapis.com/remarkable-codex-toolchain/codex-x86_64-cortexa7hf-neon-rm11x-toolchain-3.1.15.sh -o installer.sh && \
    chmod +x installer.sh && \
    ./installer.sh -y && \
    rm installer.sh

# Set the working directory
WORKDIR /mnt/RemarkableLamyEraser/

# Copy the project files into the container
COPY ./ ./

# Default command to compile the project
CMD ["/bin/bash"]