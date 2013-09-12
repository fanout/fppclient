VERSION = 1.0.0

all: dist

distclean:
	rm -f fppclient-$(VERSION).js fppclient-$(VERSION).min.js

clean:

dist: fppclient-$(VERSION).min.js

fppclient-$(VERSION).js: fppclient.js
	cp fppclient.js fppclient-$(VERSION).js

fppclient-$(VERSION).min.js: fppclient-$(VERSION).js
	sed -e "s/DEBUG = true/DEBUG = false/g" fppclient-$(VERSION).js | ./compile.py > fppclient-$(VERSION).min.js.tmp
	mv fppclient-$(VERSION).min.js.tmp fppclient-$(VERSION).min.js
