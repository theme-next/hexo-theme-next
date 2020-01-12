#!/bin/sh

# Create hexo project
echo "- Create hexo project"
cd ..
npm install -g hexo
npm install -g 0x
mv repo next
hexo init repo
cd repo
mv ../next themes/next
hexo config theme next

# Clone data
echo "- Import 300 posts"
git clone https://github.com/SukkaLab/hexo-many-posts.git source/_posts/hexo-many-posts --depth=1 --quiet

# Exec 0x
echo "- Generating flamegraph..."
0x --output-dir 'dist' -- node ./node_modules/.bin/hexo g
mv dist/flamegraph.html dist/index.html
