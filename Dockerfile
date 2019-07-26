from alpine as builder
WORKDIR /root/
RUN wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.tar.gz

from scratch
copy  --from=builder /root/jdk-10.0.2_linux-x64_bin.tar.gz .