test:
	make -f tests/Makefile test-all

deploy:
	make -f build/Makefile deploy

all: deploy test
