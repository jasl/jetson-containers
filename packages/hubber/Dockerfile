#---
# name: hubber
# group: jasl
# depends: [python, pycuda, protobuf:cpp, huggingface_hub, numba, numpy, tensorflow2, opencv, pytorch, torchvision, transformers, xformers, auto_gptq, exllama:v2, llama_cpp:ggu]
# requires: '>=36.2.0'
# notes: A full featured Huggingface runner sandboxie
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# Dependencies
ADD requirements.txt /root
RUN pip3 install --no-cache-dir --verbose -r /root/requirements.txt

# partially initialized module 'cv2' has no attribute 'gapi_wip_gst_GStreamerPipeline'
RUN cd /opt && ./opencv_install.sh

# set the cache dir for models
ENV DIFFUSERS_CACHE=/data/models/diffusers

RUN pip3 install --no-cache-dir --verbose jupyterlab voila ipywidgets
RUN jupyter lab --version && jupyter lab --generate-config
ADD jupyter_server_config.json /root/.jupyter

COPY docker-entrypoint.sh /usr/local/bin

WORKDIR /root

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash"]
