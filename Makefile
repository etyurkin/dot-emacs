EMACS ?= emacs

clean:
	@rm -f init.elc config.el config.elc core.el components/*.el
	@find lisp -name '*.elc' -delete 2>/dev/null || true
	@find eln-cache -name 'config-*.eln' -delete 2>/dev/null || true

compile: clean
	@$(EMACS) -Q --batch \
	  --eval "(setq user-emacs-directory (file-name-as-directory (expand-file-name default-directory)))" \
	  -l init.el --eval '(kwarks/tangle-config)'
