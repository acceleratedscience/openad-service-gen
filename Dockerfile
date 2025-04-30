FROM nvidia/cuda:11.8.0-runtime-ubi8

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=true \
    POETRY_CACHE_DIR=/tmp/poetry_cache \
    PYTHON_CONFIGURE_OPTS="--enable-framework" 
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN yum update -y && \
    yum install -y \
    gcc \
    gcc-c++ \
    openssl-devel \
    bzip2-devel \
    libffi-devel \
    zlib-devel \
    wget \
    make \
    libXext libSM libXrender sqlite-devel-3.26.0-19.el8_9.x86_64 xz-devel  && \
    yum clean all && \
    rm -rf /var/cache/yum 
    RUN dnf -y install gcc-c++
   
# Download and install Python 3.10.14
RUN cd /usr/src && \
    wget https://www.python.org/ftp/python/3.10.14/Python-3.10.14.tgz && \
    tar xzf Python-3.10.14.tgz && \
    cd Python-3.10.14 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    ln -s /usr/local/bin/python3.10 /usr/bin/python3.10 && \
    ln -s /usr/local/bin/pip3.10 /usr/bin/pip3.10 && \
    cd /usr/src && \
    rm -rf Python-3.10.14.tgz Python-3.10.14 

# copy source install requirements
WORKDIR /src
COPY pyproject.toml poetry.lock /src/
COPY openad_model_generation_service /src/openad_model_generation_service
COPY Readme.md /src
ENV PATH="/src/.venv/bin:$PATH"

RUN pip3.10 install --upgrade pip && pip3.10 install poetry==1.8.2  && pip3.10 install backports.lzma &&\
poetry --directory=/src/ install --only main  --no-cache \
&& rm -rf ~/.cache && rm -rf ~/Library/Caches/pypoetry/artifacts && pip cache purge && rm -rf /tmp/poetry_cache

# set permissions for OpenShift
# from https://docs.openshift.com/container-platform/4.5/openshift_images/create-images.html#images-create-guide-general_create-images
RUN mkdir -p ./oracle /.config /.cache /.gt4sd /.paccmann && \
    chgrp -R 0 ./oracle /.config /.cache /.gt4sd /.paccmann && \
    chmod -R g=u ./oracle /.config /.cache /.gt4sd /.paccmann

# excluding the .venv directory from recursive permissions
RUN find /src -path /src/.venv -prune -o -print | xargs chgrp 0 && \
    find /src -path /src/.venv -prune -o -exec chmod g=u {} +

EXPOSE 8080 80

CMD ["/src/.venv/bin/python3.10", "/src/openad_model_generation_service/service.py"]
 