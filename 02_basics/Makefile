# Nom de base du fichier:
# donné en argument lors de
# l'appel de ce makefile

# Nom du fichier source en assembleur
ASM_FILE = $(FILE_BASE).s

# Dossier de sortie
OUT_DIR = release

# Nom du fichier objet
OBJ_FILE = $(OUT_DIR)/$(FILE_BASE).o

# Nom du fichier exécutable
EXEC_FILE = $(OUT_DIR)/$(FILE_BASE)

# Règle par défaut
all: $(EXEC_FILE)

# Règle pour créer l'exécutable
$(EXEC_FILE): $(OBJ_FILE)
	ld -o $(EXEC_FILE) $(OBJ_FILE)

# Règle pour créer le fichier objet
$(OBJ_FILE): $(ASM_FILE)
	mkdir -p $(OUT_DIR)
	as -o $(OBJ_FILE) $(ASM_FILE)

# Règle pour nettoyer les fichiers générés
clean:
	rm -rf $(OUT_DIR)
