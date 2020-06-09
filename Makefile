# Targets:
# ========
# make all                - compiles materials
# make publish            - compiles materials and publishes in a development directory
# make MODE=final publish - compiles materials, produces archives and publishes all in a final directory

MODE?=devel

ifeq ($(MODE),final)
	MAIN_ID=R_course
	PUBLISH_COMMENT=Full course version has been published.
else
	MAIN_ID=R_course_test
	PUBLISH_COMMENT=Development version (no .zip and .tgz archives) has been installed. To publish final version use: make MODE=final publish
endif

SHARK_DIR=/bam-export/$(MAIN_ID)
R_COURSE_URL=https://github.com/rxmenezes/RcourseNKI
R_COURSE_GIT=https://github.com/rxmenezes/RcourseNKI
PARAMS=params=list( RCourseGitURL="$(R_COURSE_GIT)", RCourseURL="$(R_COURSE_URL)" )

SHARK_GROUP=5-A-SHARK_BioCentEXP

# setting language hangs R-3.3.1 up
R=LANGUAGE=C R --vanilla -q
#R=R --vanilla

# ------------------------------------------------------------------------
# COMPONENTS: provide course source files here
# ------------------------------------------------------------------------


#
# Here are the main documents WITH tasks (dir/file.Rmd and dir/file.tasks.Rmd)
#
MAIN_TASK_DOCs=\
  01_new2018/02_basics \
  01_new2018/03_projects_and_scripts \
  01_new2018/04_dataframes \
  01_new2018/05_character_factor_basics \
  01_new2018/06_help \
  02_new2018/01_basic_data_types_cont \
  02_new2018/02_selecting \
  02_new2018/03_data_frames \
  02_new2018/05_matrices \
  03_new2018/02_rmarkdown \
	03_new2018/01_lists \
	03_new2018/02_S3_objects \
	03_new2018/03_regression \
	03_new2018/04_advanced_factors \
	04_new2018/01_userDefinedFunctions \
	06/character_strings \
	07/01_more_formulae \
	07/02_exporting_plots \
	07.2017/01_regression \
	08/s3s4 \
	10/final \
	
  	
#08_new2018/final2 

#
# Here are the main documents WITHOUT tasks (dir/file.Rmd)
#
MAIN_DOCs=\
  01_new2018/00_datasets \
  01_new2018/01_introduction \
	07/03_S3_S4_classes \
	08.1/GPP \
  04_new2018/02_rmarkdown \
  05.renee/03_makingErrors \

#
# Here are NO MAIN documents, but ONLY tasks (dir/file.tasks.Rmd)
#
TASK_DOCs=\
	07/04_extra \
#	07.2017/02_plenty \

# ------------------------------------------------------------------------

DIRs:=\
	$(subst /,,$(sort $(dir $(MAIN_TASK_DOCs) $(MAIN_DOCs) $(TASK_DOCs)))) \
	data

MAIN_HTML_SOURCEs:=\
	$(addsuffix .Rmd,$(MAIN_DOCs) $(MAIN_TASK_DOCs))
	
MAIN_HTML_TARGETs:=\
	$(addsuffix .html,$(MAIN_DOCs) $(MAIN_TASK_DOCs))

TASK_SOURCEs:=\
	$(addsuffix .tasks.Rmd,$(TASK_DOCs) $(MAIN_TASK_DOCs))
	
TASK_TARGETs:=\
	$(addsuffix .tasks.code.html,$(TASK_DOCs) $(MAIN_TASK_DOCs)) \
	$(addsuffix .tasks.nocode.html,$(TASK_DOCs) $(MAIN_TASK_DOCs))

DIR_TARGETs:=\
	$(addsuffix /_output.yaml,$(DIRs))
	
DATA_SOURCEs:=\
	$(foreach D,$(DIRs),$(wildcard $(D)/*.RData)) \
	$(foreach D,$(DIRs),$(wildcard $(D)/*.txt)) \
	$(foreach D,$(DIRs),$(wildcard $(D)/*.csv)) \
	$(foreach D,$(DIRs),$(wildcard $(D)/*.tsv)) \
	$(foreach D,$(DIRs),$(wildcard $(D)/*.png)) \
	$(foreach D,$(DIRs),$(wildcard $(D)/*/*.png)) \
	data/.htaccess \
	data/objects.R

INDEX_SOURCEs:=\
	README.Rmd \
	Makefile \
	_output.yaml \
	_output.sub.yaml \
	R_course.Rproj \
	R_course_setup.R \

INDEX_TARGETs:=\
	index.html \
	README.md

ifeq ($(MODE),final)
FINAL_PACKAGEs:=\
	R_course.tgz \
	R_course.zip
else
FINAL_PACKAGEs:=
endif

CHECK_FILEs:=\

# ------------------------------------------------------------------------

SOURCEs=$(MAIN_HTML_SOURCEs) $(TASK_SOURCEs) $(DATA_SOURCEs) $(INDEX_SOURCEs)

TARGETs=$(MAIN_HTML_TARGETs) $(TASK_TARGETs) $(DIR_TARGETs) $(INDEX_TARGETs)

# ------------------------------------------------------------------------
# MAIN TARGETS
# ------------------------------------------------------------------------

#
# all: produce all course materials
#
all: $(TARGETs)

deps: .all_R_lib_deps

#
# publish: install the materials on shark
#
publish: $(SOURCEs) $(TARGETs) $(FINAL_PACKAGEs)
	( \
		PRE=$(SHARK_DIR).pre; \
		POST=$(SHARK_DIR).post; \
		CUR=$(SHARK_DIR); \
		GROUP=$(SHARK_GROUP); \
		FILEs="$(sort $^)"; \
		DIRs="$(sort $(dir $^))"; \
		ssh shark "( rm -rf $$PRE ) && ( mkdir -p $$PRE ) && ( rm -rf $$PRE/* )" && \
		rsync -v -R $$FILEs shark:$$PRE && \
		ssh shark "( cd $$PRE && chgrp $$GROUP . $$DIRs $$FILEs && chmod o+rX,g+rwsX . $$DIRs && chmod o+rX,g+rwX $$FILEs ) && ( rm -rf $$POST ) && ( mv $$CUR $$POST || true ) && ( mv $$PRE $$CUR )" \
	)
	@echo
	@echo ====================================================================================================================================
	@echo "Installed in:     shark:$(SHARK_DIR)"
	@echo "Accessible at:    $(R_COURSE_URL)"
	@echo
	@echo "$(PUBLISH_COMMENT)"
	@echo ====================================================================================================================================
	@echo

#
# clean: remove automatically generated documents
#
clean: 
	-$(RM) $(TARGETs) $(FINAL_PACKAGEs) $(CHECK_FILEs)

# ------------------------------------------------------------------------
# implementation
# ------------------------------------------------------------------------

test: clean all

list_sources: $(SOURCEs)
	@echo $^

R_course.tgz: $(SOURCEs) $(TARGETs)
	tar cvzf '$@.tmp' $(sort $^) && /bin/mv '$@.tmp' '$@'

R_course.zip: $(SOURCEs) $(TARGETs)
	zip '$@.tmp' $(sort $^) && /bin/mv '$@.tmp' '$@'

# ------------------------------------------------------------------------

%.tasks.code.md: %.tasks.Rmd
	$(MAKE) $(dir $@)/_output.yaml
	( cd $(dir $@); $(R) -e 'knitr::opts_chunk$$set( echo = TRUE, eval = TRUE, comment = NA ); $(PARAMS); rmarkdown::render( "$(notdir $<)", output_format = "md_document", output_file = "$(notdir $@)" );' )

%.tasks.nocode.md: %.tasks.Rmd
	$(MAKE) $(dir $@)/_output.yaml
	( cd $(dir $@); $(R) -e 'knitr::opts_chunk$$set( echo = FALSE, eval = FALSE, comment = NA ); $(PARAMS); rmarkdown::render( "$(notdir $<)", output_format = "md_document", output_file = "$(notdir $@)" );' )

%.md: %.Rmd
	$(MAKE) $(dir $@)/_output.yaml
	$(R) -e 'knitr::opts_chunk$$set( comment = NA ); $(PARAMS); rmarkdown::render( "$<", "md_document" );'

%.tasks.code.html: %.tasks.Rmd
	$(MAKE) $(dir $@)/_output.yaml
	( cd $(dir $@); $(R) -e 'knitr::opts_chunk$$set( echo = TRUE, eval = TRUE, comment = NA ); $(PARAMS); rmarkdown::render( "$(notdir $<)", output_format = "html_document", output_file = "$(notdir $@)" );' )

%.tasks.nocode.html: %.tasks.Rmd
	$(MAKE) $(dir $@)/_output.yaml
	( cd $(dir $@); $(R) -e 'knitr::opts_chunk$$set( echo = FALSE, eval = FALSE, comment = NA ); $(PARAMS); rmarkdown::render( "$(notdir $<)", output_format = "html_document", output_file = "$(notdir $@)" );' )

%.html: %.Rmd
	$(MAKE) $(dir $@)/_output.yaml
	$(R) -e 'knitr::opts_chunk$$set( comment = NA ); $(PARAMS); rmarkdown::render( "$<", "html_document" );'

%/_output.yaml: _output.sub.yaml
	cp $< $@

# ------------------------------------------------------------------------

index.html: README.cleaned.Rmd
	( cd $(dir $@); $(R) -e '$(PARAMS); rmarkdown::render( "$(notdir $<)", output_format = "html_document", output_file = "$(notdir $@)" );' )

README.cleaned.Rmd: README.Rmd
	cat '$<' | sed 's/[.]md/.html/g' >'$@'

README.step1.Rmd: README.Rmd
	cat '$<' | sed 's|[(]\(.*\)[.]md[)]|($(R_COURSE_URL)/\1.html)|g' >'$@'

README.step1.md: README.step1.Rmd
	( cd $(dir $@); $(R) -e '$(PARAMS); rmarkdown::render( "$(notdir $<)", output_format = "md_document", output_file = "$(notdir $@)" );' )

README.md: README.step1.md
	cat '$<' >'$@'

# ------------------------------------------------------------------------

.all_R_lib_deps: $(addsuffix .R_lib_deps,$(filter %.R %.Rmd,$(SOURCEs)))
	cat $^ >'$@'

include .all_R_lib_deps

%.Rmd.R_lib_deps: %.Rmd
	@cat $^ | perl -e 'while( <> ){ if( $$_ =~ /^library\s*[(]\s*([^ ]+)\s*[)]/ ){ $$l = $$1; $$l =~ s/"//g; push @ls, $$l } }; map { print "$*.Rmd: R_libs/$$_.R_lib_installed\n" } @ls;' | sort | uniq >'$@'

%.R.R_lib_deps: %.R
	@cat $^ | perl -e 'while( <> ){ if( $$_ =~ /^library\s*[(]\s*([^ ]+)\s*[)]/ ){ $$l = $$1; $$l =~ s/"//g; push @ls, $$l } }; map { print "$*.Rmd: R_libs/$$_.R_lib_installed\n" } @ls;' | sort | uniq >'$@'
	
R_libs/%.R_lib_installed:
	#$(R) -e 'if( length( find.package( "$*", quiet = TRUE ) ) == 0 ){ try( install.packages( pkgs = "$*", dependencies = TRUE, repos = "http://cran.us.r-project.org", quiet = TRUE ) ) }'
	$(R) -e 'if( length( find.package( "$*", quiet = TRUE ) ) == 0 ){ if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install( "$*" ) }'

# ------------------------------------------------------------------------


