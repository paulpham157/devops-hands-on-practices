run "default_plan_values" {
  command = plan

  assert {
    condition     = module.nginx_site.container_name == "docker-course-dev-nginx"
    error_message = "Default container name should include project and environment."
  }

  assert {
    condition     = module.nginx_site.container_url == "http://localhost:8095"
    error_message = "Default URL should use host_port 8095."
  }
}

run "custom_environment_and_port" {
  command = plan

  variables {
    environment = "test"
    host_port   = 8096
  }

  assert {
    condition     = module.nginx_site.container_name == "docker-course-test-nginx"
    error_message = "Container name should change when environment changes."
  }

  assert {
    condition     = module.nginx_site.container_url == "http://localhost:8096"
    error_message = "URL should change when host_port changes."
  }
}
