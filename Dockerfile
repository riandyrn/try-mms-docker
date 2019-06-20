FROM awsdeeplearningteam/mxnet-model-server:latest
COPY squeezenet_v1.1.mar .
CMD ["mxnet-model-server", "--start", "--models", "squeezenet=./squeezenet_v1.1.mar", "--model-store", "."]
EXPOSE 8080-8081