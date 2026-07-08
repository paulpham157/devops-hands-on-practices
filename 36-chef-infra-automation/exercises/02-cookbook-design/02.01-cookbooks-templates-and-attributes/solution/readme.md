# Cookbooks, Templates, and Attributes

1. `cookbooks/docker_host/attributes/default.rb` owns the cookbook default.
2. `cookbooks/docker_host/templates/default/daemon.json.erb` renders the final file.
3. Environment-specific overrides should be set through policy data or environment-specific policy workflows, not by forking the recipe.
