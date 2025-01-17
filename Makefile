# Define the Python environment
PYTHON = python3
PIP = pip

# Define the location for virtual environment
VENV_DIR = .venv

# Define the app folder
APP_DIR = app

# Define the paths to lint, test, and format
LINT_PATH = $(APP_DIR)
TEST_PATH = $(APP_DIR)
FORMAT_PATH = $(APP_DIR)

# Install dependencies from requirements.txt
.PHONY: install
install:
	@echo "Installing Dependencies..."
	$(VENV_DIR)/bin/$(PIP) install -r requirements.txt
	@echo "Dependencies are Installed."

# Run linting using pylint
.PHONY: lint
lint:
	@echo "Running Pylint..."
	$(VENV_DIR)/bin/pylint $(LINT_PATH)

# Run formatting using black
.PHONY: format
format:
	@echo "Running Black..."
	$(VENV_DIR)/bin/black $(FORMAT_PATH)

# Run tests using pytest
.PHONY: test
test:
	@echo "Running Tests..."
	$(VENV_DIR)/bin/pytest $(TEST_PATH)

# Clean up virtual environment and pycache
.PHONY: clean
clean:
	@echo "Cleaning Up..."
	rm -rf $(VENV_DIR)
	rm -rf $(APP_DIR)/__pycache__
	@echo "Clean up complete."

# Install dependencies, lint, format, and run tests in one go
.PHONY: all
all: install lint format test
	@echo "All Tasks Completed Successfully. . ."