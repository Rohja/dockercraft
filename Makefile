
all: build clean run
	@echo "Done."

build:
	@echo "Building Docker image."
	docker build -t dockercraft .

clean:
	@echo "Removing old Docker image."
	docker rm -f dockercraft || echo "No dockercraft container found."

run:
	@echo "Starting container."
	docker run -t -i -d -p 25565:25565 \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--name dockercraft \
		dockercraft

logs:
	docker logs -f dockercraft