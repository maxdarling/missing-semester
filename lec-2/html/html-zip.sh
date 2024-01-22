find . -type f -name "*.html" | tr \\n \\0 | xargs -0 zip test.zip
