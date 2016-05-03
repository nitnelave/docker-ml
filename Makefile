%: docker-%/Dockerfile
	$(MAKE) -C `dirname $<`

