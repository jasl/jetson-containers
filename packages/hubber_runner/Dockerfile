#---
# name: hubber_runner
# group: jasl
# depends: [python, huggingface_hub, numba, numpy, l4t-pytorch, l4t-tensorflow:tf2, transformers, xformers, optimum, bitsandbytes, flash_attn, auto_gptq, awq, exllama:v2, llama_cpp:gguf]
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

RUN pip3 install --no-cache-dir --verbose jupyterlab jupytext voila ipywidgets gradio tensorboard
RUN jupyter lab --version && jupyter lab --generate-config
ADD jupyter_server_config.json /root/.jupyter

COPY docker-entrypoint.sh /usr/local/bin

# set the cache dir for models
ENV DIFFUSERS_CACHE=/data/models/diffusers
ENV HUGGINGFACE_HUB_CACHE=/data/models/huggingface
ENV HF_HOME=/data/models/huggingface

WORKDIR /root

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash"]
