build:
	coffee -c index.coffee

unbuild:
	rm index.js

publish:
	make build
	npm publish .
	make unbuild
