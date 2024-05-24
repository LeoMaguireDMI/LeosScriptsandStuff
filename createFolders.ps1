# Define the base directory
$baseDir = "C:\Users\maguirl1\Documents\GitHub\LeosScriptsandStuff\Exchange"

# Define the directories to create
$directories = @(
    "src\Module1\Public",
    "src\Module1\Private",
    "src\Module2\Public",
    "src\Module2\Private",
    "tests",
    "docs",
    "scripts"
)

# Create the directories
foreach ($directory in $directories) {
    $fullPath = Join-Path -Path $baseDir -ChildPath $directory
    New-Item -ItemType Directory -Force -Path $fullPath
}

# Create the .gitignore and README.md files
New-Item -ItemType File -Force -Path (Join-Path -Path $baseDir -ChildPath ".gitignore")
New-Item -ItemType File -Force -Path (Join-Path -Path $baseDir -ChildPath "README.md")