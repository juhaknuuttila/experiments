#!/usr/bin/env bash

#usage - ./install_test3 <package1> <package2> <package3> ...
#example - ./install_test3 useCRAN bitops stringr arules

echo "Sample action script to install R packages..."

REPO=

if [ -f /usr/bin/R ]
then
        $biocLite = "biocLite"
        R --save --restore -q -e "source(c($biocLite))"

        #loop through the parameters (i.e. packages to install)
        for i in "$@"; do
                if [ -z $name ]
                then
                        if [ "$i" == "useCRAN" ]
                        then
                                REPO="http://cran.us.r-project.org"
                        else
                                name=\'$i\'
                        fi

                else
                        name=$name,\'$i\'
                fi
        done

        echo "Install packages..."

        if [ -z $REPO ]
        then
                R --save --restore -q -e "biocLite(c($name))"
        else
                R --save --restore -q -e "biocLite(c($name))"
        fi

else
        echo "R not installed"
        exit 1
fi

echo "Finished"

