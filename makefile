#Makefile

#Variable declarations for holding results of shell command executions.
DATE=$(shell date)
TOTAL_NO_OF_LINES=$(shell cat guessinggame.sh | wc -l | tr -d ' ')
LINES_OF_CODE=$(shell cat guessinggame.sh | grep -vE "(\#|^$$)" | wc -l | tr -d ' ')
LINES_OF_COMMENT=$(shell cat guessinggame.sh | grep -E '\#' | wc -l | tr -d ' ')
BLANK_LINES=$(shell cat guessinggame.sh | grep -E '^$$' | wc -l | tr -d ' ')

#all
all: README.md

#README.md creation : Dependency - guessinggame.sh.
README.md: guessinggame.sh
	@rm -f README.md
	@echo "# Guessing Game - v.0.1" >> README.md
	@echo "``**README.md**`` - Created on : "$(DATE) >> README.md
	@echo "" >> README.md
	@echo "|  **File Summary - guessinggame.sh**  | **Counts** |" >> README.md
	@echo "|--------------------------------------|------------|" >> README.md
	@echo "|Total No. of lines in guessinggame.sh |  **"$(TOTAL_NO_OF_LINES)"**    |" >> README.md
	@echo "|    - Total number of lines of code   |    "  $(LINES_OF_CODE) "    |" >> README.md
	@echo "|    - Total number of lines of comment|    " $(LINES_OF_COMMENT) "    |" >> README.md
	@echo "|    - Total number of blank lines     |    "  $(BLANK_LINES) "    |" >> README.md

	@echo "Created README.md"

#clean
clean:
	@rm -f README.md
