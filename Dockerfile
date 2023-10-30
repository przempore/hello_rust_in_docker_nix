# Use the official Rust image as a base image
FROM rust:latest

# Update the system and install any other dependencies you might need
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    libssl-dev

RUN rustup toolchain install nightly
RUN rustup default nightly
RUN rustup target add wasm32-unknown-unknown

RUN cargo install trunk

# Create a working directory
WORKDIR /usr/src/app

# Copy your project's source code into the container
COPY hello_rust .
