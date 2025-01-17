# Define the Python environment
PYTHON = python3
PIP = pip

# Define the location for virtual environment
VENV_DIR = .venv

# Define the folders
APP_DIR = app
NLP_DIR = nlplogic
TEST_DIR = test

# Define the paths to lint, test, and format
LINT_PATHS = $(APP_DIR) $(NLP_DIR) $(TEST_DIR)
FORMAT_PATHS = $(APP_DIR) $(NLP_DIR) $(TEST_DIR)
TEST_PATHS = $(TEST_DIR)

# ANSI color codes
INDIGO = \033[34m
GREEN = \033[32m
RESET = \033[0m

# Install dependencies from requirements.txt
.PHONY: install
install:
	@echo "$(INDIGO)Installing Dependencies...$(RESET)"
	$(PYTHON) -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/$(PIP) install --upgrade pip
	$(VENV_DIR)/bin/$(PIP) install -r requirements.txt
	@echo "$(GREEN)Dependencies Installed.$(RESET)\n"

# Run linting using pylint
.PHONY: lint
lint:
	@echo "$(INDIGO)Running Pylint...$(RESET)"
	$(VENV_DIR)/bin/pylint $(LINT_PATHS)
	@echo "$(GREEN)Linting Completed.$(RESET)\n"

# Run formatting using black
.PHONY: format
format:
	@echo "$(INDIGO)Running Black...$(RESET)"
	$(VENV_DIR)/bin/black $(FORMAT_PATHS)
	@echo "$(GREEN)Formatting Completed.$(RESET)\n"

# Run tests using pytest
.PHONY: test
test:
	@echo "$(INDIGO)Running Tests...$(RESET)"
	$(VENV_DIR)/bin/pytest $(TEST_PATHS) --cov=$(APP_DIR) --cov=$(NLP_DIR)
	@echo "$(GREEN)Tests Completed.$(RESET)\n"

# Clean up virtual environment and pycache
.PHONY: clean
clean:
	@echo "$(INDIGO)Cleaning Up...$(RESET)"
	rm -rf $(VENV_DIR)
	find . -type d -name "__pycache__" -exec rm -rf {} +
	@echo "$(GREEN)Cleanup Completed.$(RESET)\n"

# Install dependencies, lint, format, and run tests in one go
.PHONY: all
all: install lint format test
	@echo "$(GREEN) || All Tasks Completed Successfully. . .$(RESET)\n"