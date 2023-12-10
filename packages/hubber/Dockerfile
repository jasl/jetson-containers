#---
# name: hubber
# group: jasl
# depends: [python, numpy, rust]
# notes: A full featured Huggingface runner sandboxie
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN pip3 install --no-cache-dir --verbose jupyterlab voila ipywidgets
    
RUN jupyter lab --version && jupyter lab --generate-config
RUN python3 -c "from jupyter_server.auth import passwd; passwd('nvidia')"

COPY docker-entrypoint.sh /usr/local/bin

WORKDIR /root

ENTRYPOINT ["docker-entrypoint.sh"]
