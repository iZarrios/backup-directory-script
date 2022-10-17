all: backfile generate

backfile:
	@if test -d $(BACKUPDIR); \
		then echo exists; \
		else mkdir $(BACKUPDIR) ; \
		fi

# backupfile must run before generate

generate: backfile
	@./backupd.sh $(DIR) $(BACKUPDIR) $(INTERVAL-SECS) $(MAX-BACKUPS)

clean:
	@if test -d $(BACKUPDIR); \
		then rm -r $(BACKUPDIR); \
		fi
