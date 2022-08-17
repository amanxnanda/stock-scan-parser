#!/bin/bash

echo "###########################################"
echo "Deleting top level \"coverage\" folder"
rm -rf coverage
echo "Creating top level \"coverage\" folder"
mkdir coverage
cd coverage
echo "Creating \"lcov.base.info\" file inside \"coverage\" folder"
touch lcov.base.info
cd ..

for module in "data" "domain" "presentation"
do
    echo "###########################################"
    echo "[$module]: Initialized tests & coverage"
    cd layers/"$module" || exit
    echo "[${module}]: Deleting \"coverage\" folder"
    rm -rf coverage
    echo "[${module}]: Running tests"
    flutter test --coverage --coverage-path=coverage/"${module}".info
    echo "[$module]: Finished tests"
    var1=lib/
    var2=layers/${module}/lib/

    sed "s@${var1}@${var2}@" coverage/"${module}".info >> coverage/lcov.info
    echo "[$module]: Copying generated coverage to base coverage file\"lcov.base.info\""
    cat coverage/lcov.info >> ../../coverage/lcov.base.info
    echo "[$module]: Finished tests & coverage"
    cd ../..
done
echo "###########################################"
genhtml coverage/lcov.base.info -o coverage/html
echo "Generated coverage report HTML and launching now"
open coverage/html/index.html
