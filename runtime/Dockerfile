FROM frolvlad/alpine-glibc:latest
LABEL io.openshift.s2i.scripts-url="image:///usr/local/s2i/bin" \
      io.openshift.s2i.assemble-input-files="/opt/dist"
COPY s2i /usr/local/s2i/
RUN apk update && apk add bash gmp
