

all:
	cd build/out && cmake ../.. && cmake --build .
	@echo "################## Application compiled successfully"

run:
	cd build/out/app && ./app.exe

clean:
	rm -rf build/out
	cd build && mkdir out