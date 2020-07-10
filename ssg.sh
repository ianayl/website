#!/bin/sh

# shsg - shell site generator
#
# A simple static site generator written in pure POSIX sh
# - The themes are located in ./themes
# - The pages for the website are located in ./pages
# - The finished website is located at ./public

usage() {
    >&2 echo "Usage: ./ssg.sh [-bch]
\t-b\tbuild the site into ./public
\t-c\tclean up current site
\t-h\tprint this help message
"
}

# clean up after myself
clean() {
    echo "==> Cleaning up..."
    rm -vr ./public
}

# temporarily what build is for now
build() {
    clean
    mkdir -v public
    cp -rv src/styles public/styles
    cp -rv src/index.html public/index.html
}

[ "$1" ] || usage
case $1 in
    -b) build ;;
    -c) clean ;;
    *) usage ;;
esac
