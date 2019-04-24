FROM frolvlad/alpine-glibc:latest
LABEL io.openshift.s2i.scripts-url="image:///usr/local/s2i/bin" \
      io.openshift.s2i.assemble-input-files="/opt/dist"
COPY s2i /usr/local/s2i/
RUN addgroup -g 1001 appuser && \
    adduser -S -h /tmp/home -u 1001 -g appuser appuser && \
    mkdir /opt/dist && \
    chown appuser:appuser /opt/dist
RUN apk update && apk add gmp
USER appuser
