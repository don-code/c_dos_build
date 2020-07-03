#!/bin/bash
set -euxo pipefail

TEST_TAG=c_dos_build:test

rm -f test/TEST.TXT test/TEST.COM

docker build -t $TEST_TAG .
docker run -t --rm -v $(pwd)/test:/test -w /test $TEST_TAG bash -i -c 'dmc -mt test.c && wine TEST.COM'

ret=0
if grep "Hello, world!" test/TEST.TXT; then
  echo "DOS program executed successfully!"
else
  echo "DOS program failed to produce expected output."
  ret=1
fi

docker rmi -f $TEST_TAG
exit $ret
