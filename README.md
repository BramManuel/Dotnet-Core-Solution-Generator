# Bash .NET Core solution generator script
With this bash script you will be able to easily generate a .NET Core solution structure. You will be able to generate a project, with a test project. If you choose for a test project there will also be a reference added between the projects.

Example: 

```bash
./dotnet-2.2-solution-generator.sh -n Foo -p mvc -t mstest
```

This will generate the following structure:

```
Foo
├── Foo-mvc
│   ├── Foo-mvc.csproj
│   └── ***ALL GENERATED DOTNET NEW MVC FILES***
├── Foo.sln
└── Foo.Test
    ├── Foo.Test.csproj
    └── ***ALL GENERATED DOTNET NEW MSTEST FILES***

23 directories, 64 files
```

## Prerequisites

1.	A installed version of .NET core with the CLI.
2.	Bash based shell.

## How to use?

1.	Choose one version compatiable with your .NET core version. Set execute permission.
```bash
chmod +x dotnet-2.2-solution-generator.sh
```
2.	To run the script:
```bash
./dotnet-2.2-solution-generator.sh -n Foo -p mvc -t mstest
```

### Help

```bash
dotnet-2.2-solution-generator.sh -h
```

```
dotnet-2.2-solution-generator.sh [-h] [-n string] [-p string] [-t string] -- program to generate a .NET Core solution structure, for given project and test type.

where:
    -n Solution Name 
    -p Project Type: [mvc, web, webapi, console] 
    -t Test Project Type: [mstest, nunit, xunit] - OPTIONAL
    -h Display's this - OPTIONAL
```

## Feedback

If you have feedback or some changes you would like to see. You can send me a pull request.
