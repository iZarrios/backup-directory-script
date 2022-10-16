all: backfile generate

backfile:
	@if test -d $(BACKUPDIR); \
		then echo exists; \
		else mkdir $(BACKUPDIR) ; \
		fi

generate:
	@./backupd.sh $(DIR) $(BACKUPDIR) $(INTERVAL-SECS) $(MAX-BACKUPS)

clean:
	@if test -d $(BACKUPDIR); \
		then rm -r $(BACKUPDIR); \
		fi

test:
	@echo $(DIR)
