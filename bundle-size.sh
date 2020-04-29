#!/bin/bash

echo "1. installing libraries"
npm install
brew install jq

echo "
2. preparing folder & declaring bundle paths"
rm -rf perf/results/
mkdir -p perf/results/

echo "
3. starting bundle size analysis

---------------------------source-map-explorer--------------------------"
npm i source-map-explorer --save-dev
npm run build --prod --sourcemap
[ -e perf/results/source-map-explorer.html ] && rm perf/results/source-map-explorer.html
appBundle=dist/app/*.bundle.js
npx source-map-explorer $appBundle --html perf/results/source-map-explorer.html

echo "
------------------------webpack-bundle-analyzer-------------------------"
npm i webpack-bundle-analyzer --save-dev
npm run build --prod --stats-json
[ -e perf/results/webpack-bundle-analyzer_*.html ] && rm perf/results/webpack-bundle-analyzer_*.html
npx webpack-bundle-analyzer dist/app/stats.json -O -m static -r perf/results/webpack-bundle-analyzer_app.html

echo "
-----------------------------bundle-phobia------------------------------"
# TODO: explore https://www.npmjs.com/package/node-jq to avoid brew dependency.
[ -e perf/results/bundle-phobia-*.txt ] && rm perf/results/bundle-phobia-*.txt

# -----note: bundle-phobia could run into errors parsing certain libraries for failing to resolve version
# npm i bundle-phobia-cli -g
# bundle-phobia --package package.json

echo "Generating the direct url into a text file..."
echo "https://bundlephobia.com/scan-results?packages=" >> perf/results/bundle-phobia-link.txt
echo `jq -r '.dependencies | to_entries[] | "\(.key)@\(.value | ltrimstr("^") | ltrimstr("~")),"' package.json` >> perf/results/bundle-phobia-link.txt