ARG LTS
FROM fpco/stack-build-small:${LTS}
LABEL io.openshift.s2i.scripts-url="image:///usr/local/s2i/bin"
COPY s2i /usr/local/s2i/
RUN groupadd -g 1001 appuser && \
    useradd -r -m -d /tmp/home -u 1001 -g appuser appuser && \
    mkdir /opt/dist && \
    chown appuser:appuser /opt/dist
USER appuser
