#!/bin/sh

pwd
cd ..
npm install -g hexo
npm install -g 0x
mv repo next
hexo init repo
cd repo
mv ../next themes/next
hexo config theme next
0x --output-dir 'dist' -- node ./node_modules/.bin/hexo g
