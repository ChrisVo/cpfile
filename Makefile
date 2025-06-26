PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin

.PHONY: install uninstall test clean

install:
	@echo "Installing cpfile to $(BINDIR)..."
	@mkdir -p $(BINDIR)
	@install -m 755 cpfile $(BINDIR)/cpfile
	@echo "✓ cpfile installed successfully"
	@echo "You can now use: cpfile <file_path>"

uninstall:
	@echo "Uninstalling cpfile..."
	@rm -f $(BINDIR)/cpfile
	@echo "✓ cpfile uninstalled successfully"

test:
	@echo "Testing cpfile installation..."
	@which cpfile > /dev/null && echo "✓ cpfile is installed and in PATH" || echo "✗ cpfile not found in PATH"
	@cpfile --version 2>/dev/null && echo "✓ cpfile runs correctly" || echo "✗ cpfile failed to run"

clean:
	@echo "Nothing to clean"

help:
	@echo "Available targets:"
	@echo "  install   - Install cpfile to $(BINDIR)"
	@echo "  uninstall - Remove cpfile from $(BINDIR)"
	@echo "  test      - Test if cpfile is properly installed"
	@echo "  clean     - Clean build artifacts (none for this project)"
	@echo "  help      - Show this help message"
	@echo ""
	@echo "Variables:"
	@echo "  PREFIX    - Installation prefix (default: /usr/local)"
	@echo "  BINDIR    - Binary installation directory (default: $(PREFIX)/bin)" 