ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin | $(BUILD_DIR)
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img
$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm | $(BUILD_DIR)
	# Assemble the main.asm file into a flat binary format (-f bin) and output to main.bin
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin
$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	# Assemble the main.asm file into a flat binary format (-f bin) and output to main.bin
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin