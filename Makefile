compiler_options=.

all:
	cd build/out && cmake $(compiler_options) ../.. && cmake --build .
	@echo "################## Application compiled successfully"

run: all
	@echo "################## Application Running"
	cd build/out/app && ./app.exe

run_d:
	$(MAKE) all compiler_options=-DDEBUG_LOG=ON
	@echo "################## Application Running with DEBUG LOGS"
	cd build/out/app && ./app.exe
run_sanitize:
	$(MAKE) all compiler_options=-DSANITIZER_ENABLED=ON
	@echo "################## Application Running and Sanitizer enabled"
	cd build/out/app && ./app.exe

docs: all
	@echo "################## Generating HTML files"
	cd build/out && make docs

clean:
	rm -rf build/out
	cd build && mkdir out
	cd docs && rm -rf html