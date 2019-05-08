GIZMO_HG_SRC ?= https://bitbucket.org/phopkins/gizmo-public
MPIRUN ?= OMP_NUM_THREADS=1 mpirun
GIZMO_RUN_MODE ?=

.PHONY: compile
compile: GIZMO

GIZMO: gizmo_config.sh gizmo_hg
	cp gizmo_config.sh gizmo_hg/Config.sh
	spack diy -d gizmo_hg -n gizmo@local && eval `spack env deactivate --sh` && spack uninstall -y gizmo
	ln -s gizmo_hg/GIZMO $@

gizmo_hg:
	hg clone $(GIZMO_HG_SRC) $@

.PHONY: run-music
run-music:
	cd ic && MUSIC music.conf

.PHONY: run-gizmo
run-gizmo:
	$(MPIRUN) ./GIZMO gizmo_params.txt $(GIZMO_RUN_MODE)

.PHONY: purge
purge:
	rm ic/{*.bin,*.txt,snapshot}
	rm -r gizmo_hg/ output/ *.dat *-usedvalues GIZMO
