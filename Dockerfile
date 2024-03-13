FROM python:3.10-slim

RUN apt-get update && apt-get install gcc g++ git make -y
RUN useradd -m -u 1000 user

# Create the directory and set the permissions
RUN mkdir -p /home/langflow && chown user:user /home/langflow

USER user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH \
    LANGFLOW_DATABASE_URL=sqlite:////home/langflow/langflow.db

WORKDIR $HOME/app

COPY --chown=user . $HOME/app

RUN pip install langflow>==0.6.10 -U --user
ENTRYPOINT ["./entrypoint.sh"]
