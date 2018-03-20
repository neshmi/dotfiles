# Ruby:
#
# The -rubygems option breaks Ruby 2.5
export RUBYOPT="-Ilib -Itest"
#
# Jeff says: "can also use RUBYLIB if you're just setting lib options"
# export RUBYLIB=:./lib:./test:./test/lib:
#
# Don't need this any more?
# export RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline`"
