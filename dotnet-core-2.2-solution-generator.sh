#!/bin/bash

usage="$(basename "$0") [-h] [-n string] [-p string] [-t string] -- program to generate a .NET Core solution structure, for given project and test type.

where:
    -n Solution Name 
    -p Project Type: [mvc, web, webapi, console] 
    -t Test Project Type: [mstest, nunit, xunit] - OPTIONAL
    -h Display's this - OPTIONAL
"

if [ "$1" == "-h" ]; then
  echo "$usage"
  exit 0
fi

while getopts ":n:t:p:" opt; do
    case $opt in
        n) solution_name="$OPTARG"
        ;;
        t) test_type="$OPTARG"
        ;;
        p) project_type="$OPTARG"
        ;;
    esac
done

if [ -z "$solution_name" ];
then 
    echo "Fill in -n [PROJECT NAME]"
    exit 1
elif [ ! "$project_type" = "mvc" ] && [ ! "$project_type" = "web" ] && [ ! "$project_type" = "webapi" ] && [ ! "$project_type" = "console" ];
then 
    echo "Please fill in a valid project type: -p [mvc, web, webapi, console]"
    exit 1
elif [ ! -z "$test_type" ];
then
    if [ ! "$test_type" = "mstest" ] && [ ! "$test_type" = "nunit" ] && [ ! "$test_type" = "xunit" ];
    then
        echo "Please fill in a valid test project type: -t [mstest, nunit, xunit]"
        exit 1
    fi
fi

mkdir $solution_name
cd $solution_name
dotnet new sln -n $solution_name
dotnet new $project_type -n "$solution_name-$project_type"
if [ ! -z "$test_type" ];
then
    dotnet new $test_type -n $solution_name.Test
    dotnet add $solution_name.Test/*csproj reference "$solution_name-$project_type"/*csproj
fi

dotnet sln $solution_name.sln add **/*.csproj