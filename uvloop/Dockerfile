#
# This Dockerfile sets up a container that can build a "manylinux" python
# package for the uvloop-0.16.0 python package with the uvloop.patch patch
# applied.
#
# https://opensource.com/article/19/2/manylinux-python-wheels
# https://realpython.com/python-wheels/


FROM quay.io/pypa/manylinux2010_x86_64

COPY sha256sums uvloop.patch /root/

RUN curl -o /root/uvloop-0.16.0.tar.gz https://files.pythonhosted.org/packages/ab/d9/22bbffa8f8d7e075ccdb29e8134107adfb4710feb10039f9d357db8b589c/uvloop-0.16.0.tar.gz \
    && cd /root \
    && sha256sum sha256sums \
    && tar xvf uvloop-0.16.0.tar.gz \
    && cd uvloop-0.16.0 \
    && patch -p1 < /root/uvloop.patch

WORKDIR /root/uvloop-0.16.0

ENTRYPOINT /opt/python/cp39-cp39/bin/pip wheel /root/uvloop-0.16.0 -w output && \
           auditwheel repair ./output/uvloop-0.16.0+fortanix-cp39-cp39-linux_x86_64.whl -w output
