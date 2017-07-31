FROM alpine:latest

# install needed packages
RUN apk --update add wget

# download archive
RUN wget -q --no-check-certificate https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz

# unzip archive
RUN tar xvfJ shellcheck-latest.linux.x86_64.tar.xz

# move binary
RUN mv /shellcheck-latest/shellcheck /usr/local/bin/shellcheck

# cleanup
RUN apk del wget
RUN rm -f shellcheck-latest.linux.x86_64.tar.xz
RUN rm -fr shellcheck-latest/

# change to mount directory
WORKDIR /mnt

# set entrypoint
ENTRYPOINT ["/usr/local/bin/shellcheck"]
