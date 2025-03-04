# Define the image name and tag
$imageName = "node-myweb-app"

# Build the Docker image using the Dockerfile in the current directory
docker build -t "${imageName}" .

# Output the result
if ($LASTEXITCODE -eq 0) {
    Write-Host "Docker image '${imageName}' built successfully."
} else {
    Write-Host "Failed to build Docker image '${imageName}'."
}