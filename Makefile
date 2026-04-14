.PHONY: build run clean rebuild help install

# Variables
COBC := cobc
COBC_FLAGS := -x
SRC_DIR := src
DATA_DIR := data
BIN_DIR := src
MAIN_PROG := main
CUENTAS_PROG := cuentas
TEMP_FILE := $(DATA_DIR)/TEMP.dat

# Archivos fuente
SOURCES := $(SRC_DIR)/main.cbl $(SRC_DIR)/cuentas.cbl $(SRC_DIR)/movimiento.cbl $(SRC_DIR)/leer.cbl
EXECUTABLE := $(BIN_DIR)/$(MAIN_PROG)

# Color output
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m # No Color

# ====== TARGETS ======

help:
	@echo "$(YELLOW)=== Gestión Bancaria - Makefile ===$(NC)"
	@echo ""
	@echo "$(GREEN)Targets disponibles:$(NC)"
	@echo "  $(YELLOW)make build$(NC)      - Compila el proyecto"
	@echo "  $(YELLOW)make run$(NC)        - Compila y ejecuta la aplicación"
	@echo "  $(YELLOW)make clean$(NC)      - Elimina archivos compilados"
	@echo "  $(YELLOW)make rebuild$(NC)    - Limpia y recompila"
	@echo "  $(YELLOW)make install$(NC)    - Verifica dependencias (GnuCOBOL)"
	@echo "  $(YELLOW)make help$(NC)       - Muestra esta ayuda"
	@echo ""

build: check-compiler
	@echo "$(YELLOW)[BUILD] Compilando proyecto...$(NC)"
	@cd $(SRC_DIR) && $(COBC) $(COBC_FLAGS) main.cbl cuentas.cbl movimiento.cbl leer.cbl -o $(MAIN_PROG)
	@echo "$(GREEN)[✓] Compilación exitosa: $(EXECUTABLE)$(NC)"

run: build
	@echo "$(YELLOW)[RUN] Ejecutando aplicación...$(NC)"
	@echo ""
	@$(EXECUTABLE)
	@echo ""

clean:
	@echo "$(YELLOW)[CLEAN] Limpiando archivos generados...$(NC)"
	@rm -f $(BIN_DIR)/$(MAIN_PROG)
	@rm -f $(BIN_DIR)/$(CUENTAS_PROG)
	@rm -f $(TEMP_FILE)
	@echo "$(GREEN)[✓] Limpieza completada$(NC)"

rebuild: clean build
	@echo "$(GREEN)[✓] Reconstrucción completada$(NC)"

install:
	@echo "$(YELLOW)[CHECK] Verificando dependencias...$(NC)"
	@command -v cobc >/dev/null 2>&1 || { echo "$(RED)✗ GnuCOBOL no está instalado$(NC)"; echo "  Instálalo con: sudo apt-get install gnucobol"; exit 1; }
	@echo "$(GREEN)[✓] GnuCOBOL está instalado$(NC)"
	@cobc --version | head -1

check-compiler:
	@command -v cobc >/dev/null 2>&1 || { echo "$(RED)Error: GnuCOBOL no encontrado$(NC)"; echo "Instálalo con: sudo apt-get install gnucobol"; exit 1; }

.DEFAULT_GOAL := help
