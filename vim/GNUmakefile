depth = ..

INSTALLATION_OUT_DIR=$(vimdir)/syntax
INSTALLATION_OUT_FILES=$(LILYPOND_WORDS)

LILYPOND_WORDS = $(outdir)/lilypond-words $(outdir)/lilypond-words.vim
STEPMAKE_TEMPLATES=install-out

# vimdir defined in config.make
include $(depth)/make/stepmake.make

local-install:
	for a in compiler ftdetect ftplugin indent syntax; do \
		$(INSTALL) -d $(DESTDIR)$(vimdir)/$$a \
		&& $(INSTALL) -m 644 $(src-dir)/lilypond-$$a.vim $(DESTDIR)$(vimdir)/$$a/lilypond.vim ; \
	done

local-uninstall:
	for a in compiler ftdetect ftplugin indent syntax; do \
		rm $(DESTDIR)$(vimdir)/$$a/lilypond.vim ; \
		rmdir $(DESTDIR)$(vimdir)/$$a; \
	done
	-rmdir -p $(DESTDIR)$(vimdir)

$(LILYPOND_WORDS):
	$(call ly_progress,Making,$@,)
	cd $(top-src-dir) && $(PYTHON) $(buildscript-dir)/lilypond-words.py --words --vim --dir=$(top-build-dir)/vim/$(outdir)

all: $(LILYPOND_WORDS)
