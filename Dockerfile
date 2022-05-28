# Start from a small, trusted base image.
FROM ruby:2.7.4-alpine

ENV APP_USER             tickets_system
ENV PROJECT_DIRECTORY    app
ENV USER_HOME_DIRECTORY  /home/${APP_USER}
ENV APP_PATH             ${USER_HOME_DIRECTORY}/${PROJECT_DIRECTORY}
ENV CACHE_DIR            ${APP_PATH}/tmp/cache

# Upgrade packages.
RUN apk --no-cache --update --available upgrade

# Install system dependencies required both at runtime and build time.
RUN apk add --no-cache --update \
    && apk add build-base \
    git \
    postgresql-dev \
    postgresql-client \
    tzdata \
    curl \
    bash \
    openssh \
    bash-completion

ARG APP_USER_ID

# Create a non-root user to run the app and own app-specific files.
RUN adduser -s /bin/bash -u ${APP_USER_ID} -h ${USER_HOME_DIRECTORY} -D ${APP_USER} && \
    mkdir -p ${APP_PATH} ${CACHE_DIR} && \
    chown -R ${APP_USER}:${APP_USER} ${APP_PATH} ${CACHE_DIR}

RUN apk --no-cache --update --available upgrade

# Switch to this user.
USER ${APP_USER}

# Enable Git completion (pressing tab key) && Enable bash coloring.
RUN echo "source /usr/share/bash-completion/completions/git" >> ${USER_HOME_DIRECTORY}/.bashrc && \
    sed -i '/^#.*force_color_prompt=yes.*/s/^#//g' ${USER_HOME_DIRECTORY}/.bashrc

# We'll install the app in this directory.
WORKDIR ${APP_PATH}

COPY --chown=${APP_USER} Gemfile .
COPY --chown=${APP_USER} Gemfile.lock .

# Install gems.
RUN bundle install

# Save Rails Console's history
RUN echo -e "require 'irb/ext/save-history'\n\
IRB.conf[:SAVE_HISTORY] = 500\n\
IRB.conf[:HISTORY_FILE] = '${APP_PATH}/.irb-history'\n" >>  "${USER_HOME_DIRECTORY}/.irbrc"

# Copy over the code.
COPY --chown=${APP_USER} . .

EXPOSE 3000

RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/home/tickets_system/app/entrypoint.sh" ]

# Launch the server.
CMD [ "rails", "server", "-b", "0.0.0.0" ]
