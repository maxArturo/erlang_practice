%.beam : %.erl
	erlc -W $<

%.erl : %.yrl
	erlc -W $<

# Here's a list of the erlang modules you want compiling
# If the modules don't fit onto one line add a \ character 
# to the end of the line and continue on the next line

# get all the current erlang modules
MODULES = $(patsubst %.erl,%.beam,$(wildcard *.erl))

SUBDIRS = exercises

# The first target in any makefile is the default target.
# If you just type "make" then "make all" is assumed (because
#   "all" is the first target in this makefile)

all: compile

compile: ${MODULES} subdirs

# if you have any subdirs to execute then go in and compile

subdirs: 
	# cd exercises; make
	# cd subdir2; make

clean:
	rm -rf *.beam erl_crash.dump
	# cd exercises; make clean
	# cd subdir2; make clean


