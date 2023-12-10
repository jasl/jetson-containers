#---
# name: hubber
# group: jasl
# depends: [python, pycuda, protobuf:cpp, numba, numpy, tensorflow2, opencv, pytorch, torchvision, transformers, xformers, huggingface_hub]
# requires: '>=36.2.0'
# notes: A full featured Huggingface runner sandboxie
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# https://huggingface.co/docs/hub/models-libraries
# Unsupported: fastai, ML-Agents, NeMo, paddlenlp, Pyannote, pyctcdecode, pythae, RL-Baselines3-Zoo, Sample Factory, Stable-Baselines3, TensorFlowTTS
RUN pip3 install --no-cache-dir --verbose \
        adapters \ 
        'ai2-tango[torch]' \
        asteroid \
        bertopic \
        'diffusers[torch]' \
        'python-doctr[tf]' 'python-doctr[torch]' \
        espnet \
        keras \
        flair \
        mbrl \
        miditok \
        open_clip_torch \
        peft \
        sentence-transformers \
        setfit \
        spacy \
        span_marker \
        skops \
        speechbrain \
        timm

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
