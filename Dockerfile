FROM golang:1.23-alpine AS mdbook-asciidoc

RUN apk add --no-cache git

WORKDIR /workspace
RUN git clone https://github.com/ngyewch/mdbook-asciidoc.git
WORKDIR /workspace/mdbook-asciidoc
RUN go build -o /bin/mdbook-asciidoc .

# ----

FROM rust:1.83-alpine AS mdbook-variables

RUN apk add --no-cache musl-dev

ENV CARGO_INSTALL_ROOT=/
RUN cargo install mdbook-variables

# ----

FROM peaceiris/mdbook:v0.4.40

COPY --from=mdbook-asciidoc /bin/mdbook-asciidoc /bin/mdbook-asciidoc
COPY --from=mdbook-variables /bin/mdbook-variables /bin/mdbook-variables
