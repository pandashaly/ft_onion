IMG = onion_img
CONTAINER = ft_onion

RESET = \033[0m
RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
BLUE = \033[34m
CYAN = \033[36m

# Build the docker img
build:
	@echo "$(BLUE)Building Docker image: $(IMG)...$(RESET)"
	docker build -t $(IMG) .
	@echo "$(GREEN)Docker image $(IMG) built successfully!$(RESET)"

run:
	@echo "$(YELLOW)Stopping and removing any existing containers...$(RESET)"
	docker stop $(CONTAINER) || true
	docker rm $(CONTAINER) || true
	@echo "$(YELLOW)Running Docker container: $(CONTAINER)...$(RESET)"
	docker run -d -p 80:80 -p 4242:4242 --name $(CONTAINER) $(IMG)
	@echo "$(GREEN)Docker container $(CONTAINER) is now running!$(RESET)"

stop:
	@echo "$(RED)Stopping Docker container: $(CONTAINER)...$(RESET)"
	docker stop $(CONTAINER)
	@echo "$(GREEN)Docker container $(CONTAINER) stopped successfully!$(RESET)"

remove:
	@echo "$(RED)Removing Docker container: $(CONTAINER)...$(RESET)"
	docker rm $(CONTAINER)
	@echo "$(GREEN)Docker container $(CONTAINER) removed successfully!$(RESET)"

all: build run
	@echo "$(CYAN)Both Docker image and container are now ready and running!$(RESET)"