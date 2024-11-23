IMG = onion_img
CONTAINER = ft_onion

build:
	docker build -t $(IMG) .

run:
	docker run -d -p 80:80 -p 4242:4242 --name $(CONTAINER) $(IMG)

stop:
	docker stop $(CONTAINER)

remove:
	docker rm $(CONTAINER)
