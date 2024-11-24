# IMG = onion_img
# BOX = ft_onion

# RESET = \033[0m
# RED = \033[31m
# GREEN = \033[32m
# YELLOW = \033[33m
# BLUE = \033[34m
# CYAN = \033[36m

# # Build the docker img
# build:
# 	@echo "$(BLUE)Building Docker image: $(IMG)...$(RESET)"
# 	docker build -t $(IMG) .
# 	@echo "$(GREEN)Docker image $(IMG) built successfully!$(RESET)"

# run:
# 	@echo "$(YELLOW)Stopping and removing any existing containers...$(RESET)"
# 	docker stop $(BOX) || true
# 	docker rm $(BOX) || true
# 	@echo "$(YELLOW)Running Docker container: $(BOX)...$(RESET)"
# 	docker-compose up -d --build $(BOX) $(IMG)
# 	@echo "$(GREEN)Docker container $(BOX) is now running!$(RESET)"

# exec:
# 	@echo "$(LILAC) Running exec...$(RESET)"

# stop:
# 	@echo "$(RED)Stopping Docker container: $(BOX)...$(RESET)"
# 	docker stop $(BOX)
# 	@echo "$(GREEN)Docker container $(BOX) stopped successfully!$(RESET)"

# rm:
# 	@echo "$(RED)Removing Docker container: $(BOX)...$(RESET)"
# 	docker rm $(BOX)
# 	@echo "$(GREEN)Docker container $(BOX) removed successfully!$(RESET)"

# all: build run
# 	@echo "$(CYAN)Both Docker image and container are now ready and running!$(RESET)"

IMG = onion_img
BOX = ft_onion

RESET = \033[0m
MINT = \033[38;5;122m  # Pastel mint green
LILAC = \033[38;5;219m  # Pastel lilac/violet
PINK = \033[38;5;213m  # Pastel pink

# Build the docker image
build:
	@echo "$(LILAC)Building Docker image: $(IMG)...$(RESET)"
	docker build -t $(IMG) .
	@echo "$(MINT)Docker image $(IMG) built successfully!$(RESET)"

run:
	@echo "$(PINK)Stopping and removing any existing containers...$(RESET)"
	docker stop $(BOX) || true
	docker rm $(BOX) || true
	@echo "$(PINK)Running Docker container: $(BOX)...$(RESET)"
	docker-compose up -d --build
	@echo "$(MINT)Docker container $(BOX) is now running!$(RESET)"

stop:
	@echo "$(LILAC)Stopping Docker container: $(BOX)...$(RESET)"
	docker stop $(BOX)
	@echo "$(MINT)Docker container $(BOX) stopped successfully!$(RESET)"

rm:
	@echo "$(LILAC)Removing Docker container: $(BOX)...$(RESET)"
	docker rm $(BOX)
	@echo "$(MINT)Docker container $(BOX) removed successfully!$(RESET)"

exec:
	@echo "$(MINT)Accessing Docker container: $(BOX)...$(RESET)"
	docker exec -it $(BOX) bash

all: build run exec
	@echo "$(PINK)Both Docker image and container are now ready and running!$(RESET)"
