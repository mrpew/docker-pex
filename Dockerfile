ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}

RUN pip install --upgrade pip && pip install pex && mkdir /.pex && chmod o+rwx /.pex