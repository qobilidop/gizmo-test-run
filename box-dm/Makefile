GIZMO_HG_SRC ?= https://bitbucket.org/phopkins/gizmo-public
MPIRUN ?= mpirun
RESTART_FLAG ?=

GIZMO_HG_DIR = gizmo_hg
GIZMO_CONFIG = gizmo_config.sh
GIZMO_PARAMS = gizmo_params.txt

.PHONY: compile
compile: GIZMO

GIZMO: $(GIZMO_CONFIG) | $(GIZMO_HG_DIR)
	cp $(GIZMO_CONFIG) $(GIZMO_HG_DIR)/Config.sh
	spack diy -d $(GIZMO_HG_DIR) -n gizmo@local && eval `spack env deactivate --sh` && spack uninstall -y gizmo@local
	ln -s $(GIZMO_HG_DIR)/GIZMO $@

$(GIZMO_HG_DIR):
	hg clone $(GIZMO_HG_SRC) $@

.PHONY: run-music
run-music:
	cd ic && MUSIC music.conf

.PHONY: run-gizmo
run-gizmo:
	$(MPIRUN) ./GIZMO $(GIZMO_PARAMS) $(RESTART_FLAG)

.PHONY: purge
purge:
	rm ic/{*.bin,*.txt,snapshot}
	rm -r gizmo_hg/ output/ *.dat *-usedvalues GIZMO
