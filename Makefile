# Simple commands for set-up convenience

build-container:
	@echo "Building 'eye-test' container..."
	@docker pull jhoeller/computer-vision
	@docker build \
		--rm \
		--tag eye-test/video-vision:latest \
		--file Dockerfile \
		.

run-container:
	@docker run \
		--rm \
		-it \
		--gpus=all \
		--user $(id -u):$(id -g) \
		--group-add container_user \
		--group-add sudo \
		-v "${PWD}:/app" \
		-p 8888:8888 \
		-p 6006:6006 \
		eye-test/video-vision:latest