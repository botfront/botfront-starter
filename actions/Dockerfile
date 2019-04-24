FROM rasa/rasa_core_sdk:0.12.1

# To install system dependencies
#RUN apt-get update -qq && \
#    apt-get install -y <NAME_OF_REQUIRED_PACKAGE> && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# To install packages from PyPI
#RUN pip install --no-cache-dir <A_REQUIRED_PACKAGE_ON_PYPI>
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --no-cache-dir
COPY custom_actions /app/custom_actions/
CMD ["start", "--actions", "custom_actions"]