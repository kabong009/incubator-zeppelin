#!/bin/bash
set -e # exit with nonzero exit code if anything fails

OUTPUT_DIR=s3-source
# clear and re-create the out directory
rm -rf out || exit 0;
mkdir ${OUTPUT_DIR}

# copy the tar
echo "Current dir is ${PWD}"
ls zeppelin-distribution/target/
cp zeppelin-distribution/target/zepp*gz ./${OUTPUT_DIR}/.
cp zeppelin-distribution/target/zeppelin-0.6.0-incubating-SNAPSHOT.tar.gz ./${OUTPUT_DIR}/.

ls ${OUTPUT_DIR}
