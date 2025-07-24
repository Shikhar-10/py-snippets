PROG ?= operators
PROG_PATH ?= /home/shikhar10/Shikhar/py-snippets
Current_DIR = $(shell pwd)

# TODO:
# 1. Add a target to set-program-path, PROG_PATH variable to the desired directory
# 2. Add a target to set-program, PROG variable to the desired Python program name

.PHONY: 
	help 
	set-program 
	set-program-path 
	check-python-program
	check-program-directory
	create-python-program 
	run-python-program 
	clean-python-program 
	output-file 
	list
	clean-all
	open
	tmp_debug

help:
	@echo "Available targets for Python program management:"
	@echo "-----------------------"
	@echo "1.  \033[32m make help                    \033[0m - Show this help message"
	@echo "2.  \033[32m make set-program             \033[0m - Set the PROG variable to the desired Python program name"
	@echo "3.  \033[32m make set-program-path        \033[0m - Set the PROG_PATH variable to the desired directory"
	@echo "4.  \033[32m make check-program-directory \033[0m - Check if the program directory exists"
	@echo "5.  \033[32m make check-python-program    \033[0m - Check if the Python program exists"
	@echo "6.  \033[32m make create-python-program   \033[0m - Create a Python program structure in the specified path"
	@echo "7.  \033[32m make run-python-program      \033[0m - Run the specified Python program"
	@echo "8.  \033[32m make clean-python-program    \033[0m - Clean up Python program files"
	@echo "9.  \033[32m make output-file             \033[0m - Generate output file from the Python program execution"
	@echo "10. \033[32m make list                    \033[0m - List files in the Python program directory"
	@echo "11. \033[32m make clean-all               \033[0m - Clean all Python program files"
	@echo "12. \033[32m make open                    \033[0m - Open the Python program and output file"
	@echo "13. \033[32m make tmp_debug               \033[0m - Debugging target for Python program creation"
	@echo "-----------------------"
	@bash -c \
	'read -p "Want to run which target? (1-13): " option; \
	echo "-----------------------"; \
	if [ "$$option" = "1" ]; then \
		$(MAKE) help; \
		echo "-----------------------"; \
	elif [ "$$option" = "2" ]; then \
		$(MAKE) set-program; \
		echo "-----------------------"; \
	elif [ "$$option" = "3" ]; then \
		$(MAKE) set-program-path; \
		echo "-----------------------"; \
	elif [ "$$option" = "4" ]; then \
		$(MAKE) check-program-directory; \
		echo "-----------------------"; \
	elif [ "$$option" = "5" ]; then \
		$(MAKE) check-python-program; \
		echo "-----------------------"; \
	elif [ "$$option" = "6" ]; then \
		$(MAKE) create-python-program; \
		echo "-----------------------"; \
	elif [ "$$option" = "7" ]; then \
		$(MAKE) run-python-program; \
		echo "-----------------------"; \
	elif [ "$$option" = "8" ]; then \
		$(MAKE) clean-python-program; \
		echo "-----------------------"; \
	elif [ "$$option" = "9" ]; then \
		$(MAKE) output-file; \
		echo "-----------------------"; \
	elif [ "$$option" = "10" ]; then \
		$(MAKE) list; \
		echo "-----------------------"; \
	elif [ "$$option" = "11" ]; then \
		$(MAKE) clean-all; \
		echo "-----------------------"; \
	elif [ "$$option" = "12" ]; then \
		$(MAKE) open; \
		echo "-----------------------"; \
	elif [ "$$option" = "13" ]; then \
		$(MAKE) tmp_debug; \
		echo "-----------------------"; \
	else \
		echo "------------------------"; \
		exit 0; \
	fi'


set-program:
	@bash -c \
	'read -p "Enter the Python program name (without .py): " prog_name; \
		if [ -n "$$prog_name" ]; then \
			echo "-----------------------"; \
			echo "Setting PROG to: $$prog_name"; \
			sed -i "s/^PROG ?=.*/PROG ?= $$prog_name/" $(lastword $(MAKEFILE_LIST)); \
			echo "PROG set to: $$prog_name"; \
			echo "-----------------------"; \
		else \
			echo "-----------------------"; \
			echo "No program name provided. PROG not set."; \
			echo "-----------------------"; \
		fi'
	@bash -c \
	'read -p "Want to create a new Python program? (y/n): " create_new; \
		if [ "$$create_new" = "y" ]; then \
			echo "-----------------------"; \
			$(MAKE) create-python-program; \
		else \
			echo "-----------------------"; \
			echo "No new program will be created."; \
			echo "-----------------------"; \
		fi'

set-program-path:
	@bash -c \
	'read -p "Enter the directory path for the Python program: " prog_path; \
		if [ -n "$$prog_path" ]; then \
			echo "-----------------------"; \
			echo "Setting PROG_PATH to: $$prog_path"; \
			sed -i "s|^PROG_PATH ?=.*|PROG_PATH ?= $$prog_path|" $(lastword $(MAKEFILE_LIST)); \
			echo "PROG_PATH set to: $$prog_path"; \
			echo "-----------------------"; \
		else \
			echo "-----------------------"; \
			echo "No directory path provided. PROG_PATH not set."; \
			echo "-----------------------"; \
		fi'

check-program-directory:
	@echo "Checking Python program directory..."
	@echo "PROG_PATH   = $(PROG_PATH)"
	@echo "Current_DIR = $(Current_DIR)" && \
	if [ "$(Current_DIR)" = "$(PROG_PATH)" ]; then \
		echo "Current directory matches PROG_PATH."; \
		echo "-----------------------"; \
		echo "Python program directory $(PROG_PATH) exists."; \
		echo "-----------------------"; \
	else \
		echo "Current directory does not match PROG_PATH."; \
		echo "-----------------------"; \
		echo "Python program directory $(PROG_PATH) does not exist."; \
		echo "-----------------------"; \
		exit 0; \
	fi

check-python-program:
	@echo "Checking Python program structure in $(PROG_PATH)..."
	@if [ -f "$(PROG_PATH)/$(PROG).py" ]; then \
		echo "Python program $(PROG).py exists."; \
		echo "-----------------------"; \
		exit 0; \
	else \
		echo "Python program $(PROG).py does not exist."; \
		echo "-----------------------"; \
		exit 1; \
	fi


create-python-program:
	@-$(MAKE) check-python-program || ( \
		echo "-----------------------"; \
		echo "Creating Python program structure in $(PROG_PATH)..."; \
		touch $(PROG_PATH)/$(PROG).py; \
		echo "Opening the Python program in VS Code..."; \
		code $(PROG_PATH)/$(PROG).py; \
		echo "-----------------------"; \
		echo "You can now edit the Python program in VS Code."; \
		echo "-----------------------"; \
		echo "To run the program, use 'make run-python-program'." \
		echo "-----------------------"; \
	)

run-python-program:
	@echo "Running Python program $(PROG).py..."
	@echo "-----------------------"
	@python $(PROG_PATH)/$(PROG).py || \
	( \
		echo "-----------------------"; \
		echo "\033[31m Error: Python program execution failed. \033[0m"; \
		echo "-----------------------"; \
		exit 1; \
	)
	@echo "-----------------------"
	@echo "\033[32m Python program executed successfully. \033[0m"
	@echo "-----------------------"
	@bash -c \
	'read -p "Want the output file? (y/n): " answer; \
	if [ "$$answer" = "y" ]; then \
		$(MAKE) output-file; \
	else \
		echo "------------------------"; \
		exit 0; \
	fi'

output-file:
	@echo "Output file for Python program: $(PROG).py"
	@echo "-----------------------"
	@python $(PROG_PATH)/$(PROG).py > $(PROG_PATH)/$(PROG)_o.txt
	@echo "\033[32m Output written to $(PROG_PATH)/$(PROG)_o.txt \033[0m"
	@echo "-----------------------"
	@code $(PROG_PATH)/$(PROG)_o.txt

clean-python-program:
	@echo "Cleaning up Python program files in $(PROG_PATH)..."
	@rm -f $(PROG_PATH)/$(PROG).py
	@rm -f $(PROG_PATH)/$(PROG)_o.txt
	@echo "Python program files cleaned up."
	@echo "-----------------------"
	@echo "You can recreate the program using 'make create-python-program'."
	@echo "-----------------------"

list:
	@echo "...Listing Python program files in $(PROG_PATH)..."
	@echo "-----------------------"
	@echo "Files in $(PROG_PATH):"
	@echo "-----------------------"
	@for f in $/*; do \
		if [ -f $$f ]; then \
			echo "\033[34m $$f \033[0m"; \
		fi; \
	done	
	@echo "-----------------------"

clean-all:
	@echo "Cleaning all Python program files..."
	@rm -rf $(PROG_PATH)/*.py
	@rm -rf $(PROG_PATH)/*_o.txt
	@echo "-----------------------"
	@echo "All Python program files cleaned up."
	@echo "-----------------------"

open:
	@code $(PROG_PATH)/$(PROG).py
	@code $(PROG_PATH)/$(PROG)_o.txt
	
tmp_debug:
	@echo "-----------------------"
	@echo "...Debugging Python program creation..."
	@echo "-----------------------"
	@echo "\033[32m PROG                                        \033[0m = $(PROG).py"
	@echo "\033[32m PROG_PATH                                   \033[0m = $(PROG_PATH)/$(PROG).py"
	@echo "\033[32m Output file                                 \033[0m = $(PROG)_o.txt"
	@echo "\033[32m Output file path                            \033[0m = $(PROG_PATH)/$(PROG)_o.txt"
	@echo "\033[32m Current directory                           \033[0m = $(shell pwd)"
	@echo "\033[32m Python program structure will be created in \033[0m = $(PROG_PATH) "
	@echo "-----------------------"