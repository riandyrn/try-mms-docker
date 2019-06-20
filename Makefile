.PHONY: all clean build && all clean run && all clean test
build:
	-rm squeezenet_v1.1.mar
	model-archiver --model-name squeezenet_v1.1 --model-path squeezenet --handler mxnet_vision_service:handle
	docker build -t try-mms-docker .
run:
	-make stop
	make build
	docker run -it --rm --name try-mms-docker -p 8080:8080 -p 8081:8081 try-mms-docker
stop:
	docker stop try-mms-docker
test:
	curl -X POST http://localhost:8080/predictions/squeezenet -T kitten.jpg
