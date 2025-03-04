
terraform { 
  required_providers { 
    docker = { 
      source  = "kreuzwerker/docker" 
      version = "3.0.2" 
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    } 
  } 
} 

provider "docker" { 
  host = "npipe:////./pipe/docker_engine" 
} 

resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "powershell.exe ./buildImg.ps1"
    working_dir = "${path.module}"
  }
}

resource "docker_image" "my_app" {
  name = "node-myweb-app:latest"
  depends_on = [null_resource.execute_script]
}

resource "docker_container" "my_container" {
  name = "my-myweb-app"
  image = docker_image.my_app.name
  ports {
    internal = 3000
    external = 3000
  }
}
