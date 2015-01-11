build:
	coffee -c index.coffee
	rm index.coffee

unbuild:
	rm index.js
	git checkout index.coffee

publish:
	make build
	npm publish .
	make unbuild
