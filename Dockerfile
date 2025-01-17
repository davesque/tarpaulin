FROM rust

RUN apt-get update && \
    apt-get install -y cmake && \
    rm -rf /var/lib/apt/lists/*

COPY . /opt/tarpaulin/

RUN cd /opt/tarpaulin/ && \
    cargo install --path . && \
    rm -rf /opt/tarpaulin/ && \
    rm -rf /usr/local/cargo/registry/

WORKDIR /volume

ENTRYPOINT ["/usr/local/cargo/bin/cargo"]
