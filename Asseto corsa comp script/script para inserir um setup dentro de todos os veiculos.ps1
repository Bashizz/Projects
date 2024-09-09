# Define the source file
$sourceFile = "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\allaround.json"

# Define the list of target directories with wildcards
$targetDirectories = @(
##################################################################################################################################
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Barcelona",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\brands_hatch",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\cota",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\donington",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Hungaroring",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Imola",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\indianapolis",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Kyalami",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Laguna_Seca",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\misano",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\monza",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\mount_panorama",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\nurburgring",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\nurburgring_24h",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\oulton_park",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Paul_Ricard",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\red_bull_ring",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Silverstone",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\snetterton",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Spa",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Suzuka",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Valencia",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\watkins_glen",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Zandvoort",
    "C:\Users\User\OneDrive\Documentos\Assetto Corsa Competizione\Setups\*\Zolder"
##################################################################################################################################
)

# Resolve wildcard directories and copy the file to each resolved directory
foreach ($wildcardDir in $targetDirectories) {
    # Resolve the wildcard into actual directories
    $resolvedDirectories = Get-ChildItem -Path $wildcardDir -Directory -ErrorAction SilentlyContinue

    foreach ($directory in $resolvedDirectories) {
        # Check if the resolved directory exists (this is redundant since Get-ChildItem filters them)
        if (-not (Test-Path -Path $directory.FullName)) {
            Write-Host "Target directory does not exist: $directory.FullName" -ForegroundColor Red
        } else {
            # Copy the file to the target directory
            Copy-Item -Path $sourceFile -Destination $directory.FullName -Force
            Write-Host "Copied $sourceFile to $directory.FullName" -ForegroundColor Green
        }
    }
}
