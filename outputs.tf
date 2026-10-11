output "sagemaker_app_image_configs_id" {
  description = "Map of id values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_app_image_configs_app_image_config_name" {
  description = "Map of app_image_config_name values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => v.app_image_config_name if v.app_image_config_name != null && length(v.app_image_config_name) > 0 }
}
output "sagemaker_app_image_configs_arn" {
  description = "Map of arn values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_app_image_configs_code_editor_app_image_config" {
  description = "Map of code_editor_app_image_config values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => one(v.code_editor_app_image_config) if v.code_editor_app_image_config != null && length(v.code_editor_app_image_config) > 0 }
}
output "sagemaker_app_image_configs_jupyter_lab_image_config" {
  description = "Map of jupyter_lab_image_config values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => one(v.jupyter_lab_image_config) if v.jupyter_lab_image_config != null && length(v.jupyter_lab_image_config) > 0 }
}
output "sagemaker_app_image_configs_kernel_gateway_image_config" {
  description = "Map of kernel_gateway_image_config values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => one(v.kernel_gateway_image_config) if v.kernel_gateway_image_config != null && length(v.kernel_gateway_image_config) > 0 }
}
output "sagemaker_app_image_configs_region" {
  description = "Map of region values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => v.region if v.region != null && length(v.region) > 0 }
}
output "sagemaker_app_image_configs_tags" {
  description = "Map of tags values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "sagemaker_app_image_configs_tags_all" {
  description = "Map of tags_all values across all sagemaker_app_image_configs, keyed the same as var.sagemaker_app_image_configs"
  value       = { for k, v in aws_sagemaker_app_image_config.sagemaker_app_image_configs : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

