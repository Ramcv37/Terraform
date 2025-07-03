#!/bin/bash

# Root folder
ROOT_DIR="terraform-azure"
MODULES_DIR="$ROOT_DIR/modules"
ENVIRONMENTS=(dev test prod)
MODULES=(
  vnet subnet nsg route_table azure_vm storage_account key_vault aks aci
  app_gateway app_service container_registry application_insights log_analytics
  bastion dns_zone private_dns expressroute firewall load_balancer
  mariadb postgresql cosmosdb function_app service_bus
)

# Create root project folder
mkdir -p "$MODULES_DIR"
touch "$ROOT_DIR/.gitignore"

# Create shared Terraform files
touch "$ROOT_DIR/backend.tf"

# Create 25 module folders with base files
for module in "${MODULES[@]}"; do
  mkdir -p "$MODULES_DIR/$module"
  touch "$MODULES_DIR/$module/main.tf" "$MODULES_DIR/$module/variables.tf" "$MODULES_DIR/$module/outputs.tf"
done

# Create environments: dev, test, prod
for env in "${ENVIRONMENTS[@]}"; do
  ENV_DIR="$ROOT_DIR/environments/$env"
  mkdir -p "$ENV_DIR"
  touch "$ENV_DIR/main.tf" "$ENV_DIR/variables.tf" "$ENV_DIR/terraform.tfvars"
done

# Add to .gitignore
cat <<EOF > "$ROOT_DIR/.gitignore"
.terraform/
*.tfstate
*.tfstate.*
*.backup
*.log
*.exe
*.zip
EOF

echo "✅ Terraform structure with 25 modules and dev/test/prod environments created at '$ROOT_DIR'."

