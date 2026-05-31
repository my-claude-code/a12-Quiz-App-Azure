output "app_public_ip" {
  description = "Public IP of the app VM"
  value       = azurerm_public_ip.app.ip_address
}

output "app_url" {
  description = "Quiz app URL"
  value       = "https://${azurerm_public_ip.app.ip_address}"
}

output "entra_redirect_uri" {
  description = "Add this to your Entra app registration under Authentication > Redirect URIs"
  value       = "https://${azurerm_public_ip.app.ip_address}/auth/callback"
}

output "ssh_app" {
  description = "SSH command for the app VM"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.app.ip_address}"
}

output "postgres_fqdn" {
  description = "PostgreSQL server hostname (private, accessible from VM only)"
  value       = azurerm_postgresql_flexible_server.db.fqdn
}

output "setup_log" {
  description = "Check setup progress on the VM"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.app.ip_address} 'tail -f /var/log/app-setup.log'"
}

output "import_data_command" {
  description = "Run this on the VM to import all question JSON files"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.app.ip_address} 'cd /opt/quiz-app && source venv/bin/activate && for f in data/english/*.json data/french/*.json data/defender_pam/*.json; do python utils/import_questions.py \"$f\"; done'"
}

output "ACTION_REQUIRED" {
  description = "Steps after deployment"
  value       = <<-EOT
    1. Add redirect URI to Entra app registration:
       https://${azurerm_public_ip.app.ip_address}/auth/callback

    2. Monitor VM setup (takes ~5 minutes):
       ssh ${var.admin_username}@${azurerm_public_ip.app.ip_address} 'tail -f /var/log/app-setup.log'

    3. Import question data (after setup is complete):
       ssh ${var.admin_username}@${azurerm_public_ip.app.ip_address}
       cd /opt/quiz-app && source venv/bin/activate
       for f in data/english/*.json data/french/*.json data/defender_pam/*.json; do
           python utils/import_questions.py "$f"
       done
  EOT
}
