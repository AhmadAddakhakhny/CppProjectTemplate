compiler_options=.
target=localhost
lintOpt=

all:
	cd build/out/${target} && cmake $(compiler_options) ../../.. && cmake --build . $(lintOpt)
	@echo "################## Application compiled successfully"

run: all
	@echo "################## Application Running"
	cd build/out/localhost/app/ && ./app.exe

run_d:
	$(MAKE) all compiler_options=-DDEBUG_LOG=ON
	@echo "################## Application Running with DEBUG LOGS"
	cd build/out/localhost/app && ./app.exe
run_sanitize:
	$(MAKE) all compiler_options=-DSANITIZER_ENABLED=ON
	@echo "################## Application Running and Sanitizer enabled"
	cd build/out/localhost/app && ./app.exe

docs: all
	@echo "################## Generating HTML files"
	cd build/out/localhost && make docs

test:
	$(MAKE) all target=test compiler_options=-DTEST_ENABLED=ON 
	@echo "################## Unit Test Running"
	cd build/out/test/tests && ./test.exe

lint:
	$(MAKE) all compiler_options=-DCLANG-TIDY_ENABLED=ON  lintOpt="--target app.exe_clangtidy"
	@echo "################## Application Running and Lintting enabled"
	# cd build/out/localhost/app && ./app.exe

clean:
	rm -rf build/out
	cd build && mkdir out
	cd build/out/ && mkdir localhost
	cd build/out/ && mkdir test
	cd docs && rm -rf html