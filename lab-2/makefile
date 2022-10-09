all: backfile generate

backfile:
	@if test -d ~/.bak; \
		then echo exists; \
		else mkdir ~/.bak ; \
		fi

generate:
	@./backupd.sh . ~/.bak 1 5

clean:
	@if test -d ~/.bak; \
		then rm -r ~/.bak; \
		fi
