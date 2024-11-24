# IMG = onion_img
# CONTAINER = ft_onion

# build:
# 	docker build -t $(IMG) .

# run:
# 	docker run -d -p 80:80 -p 4242:4242 --name $(CONTAINER) $(IMG)

# stop:
# 	docker stop $(CONTAINER)

# remove:
# 	docker rm $(CONTAINER)

# Define image and container names
IMG = onion_img
CONTAINER = ft_onion

# Color codes for flashy output
COLOR_RESET = \033[0m
COLOR_RED = \033[31m
COLOR_GREEN = \033[32m
COLOR_YELLOW = \033[33m
COLOR_BLUE = \033[34m
COLOR_CYAN = \033[36m

# Build the Docker image
build:
	@echo "$(COLOR_BLUE)Building Docker image: $(IMG)...$(COLOR_RESET)"
	docker build -t $(IMG) .
	@echo "$(COLOR_GREEN)Docker image $(IMG) built successfully!$(COLOR_RESET)"

# Run the Docker container
run:
	@echo "$(COLOR_YELLOW)Running Docker container: $(CONTAINER)...$(COLOR_RESET)"
	docker run -d -p 80:80 -p 4242:4242 --name $(CONTAINER) $(IMG)
	@echo "$(COLOR_GREEN)Docker container $(CONTAINER) is now running!$(COLOR_RESET)"

# Stop the Docker container
stop:
	@echo "$(COLOR_RED)Stopping Docker container: $(CONTAINER)...$(COLOR_RESET)"
	docker stop $(CONTAINER)
	@echo "$(COLOR_GREEN)Docker container $(CONTAINER) stopped successfully!$(COLOR_RESET)"

# Remove the Docker container
remove:
	@echo "$(COLOR_RED)Removing Docker container: $(CONTAINER)...$(COLOR_RESET)"
	docker rm $(CONTAINER)
	@echo "$(COLOR_GREEN)Docker container $(CONTAINER) removed successfully!$(COLOR_RESET)"

all: build run
	@echo "$(COLOR_CYAN)Both Docker image and container are now ready and running!$(COLOR_RESET)"