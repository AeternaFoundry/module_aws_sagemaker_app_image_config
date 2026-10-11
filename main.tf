resource "aws_sagemaker_app_image_config" "sagemaker_app_image_configs" {
  for_each = var.sagemaker_app_image_configs

  app_image_config_name = each.value.app_image_config_name
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "code_editor_app_image_config" {
    for_each = each.value.code_editor_app_image_config != null ? [each.value.code_editor_app_image_config] : []
    content {
      dynamic "container_config" {
        for_each = code_editor_app_image_config.value.container_config != null ? [code_editor_app_image_config.value.container_config] : []
        content {
          container_arguments             = container_config.value.container_arguments
          container_entrypoint            = container_config.value.container_entrypoint
          container_environment_variables = container_config.value.container_environment_variables
        }
      }
      dynamic "file_system_config" {
        for_each = code_editor_app_image_config.value.file_system_config != null ? [code_editor_app_image_config.value.file_system_config] : []
        content {
          default_gid = file_system_config.value.default_gid
          default_uid = file_system_config.value.default_uid
          mount_path  = file_system_config.value.mount_path
        }
      }
    }
  }

  dynamic "jupyter_lab_image_config" {
    for_each = each.value.jupyter_lab_image_config != null ? [each.value.jupyter_lab_image_config] : []
    content {
      dynamic "container_config" {
        for_each = jupyter_lab_image_config.value.container_config != null ? [jupyter_lab_image_config.value.container_config] : []
        content {
          container_arguments             = container_config.value.container_arguments
          container_entrypoint            = container_config.value.container_entrypoint
          container_environment_variables = container_config.value.container_environment_variables
        }
      }
      dynamic "file_system_config" {
        for_each = jupyter_lab_image_config.value.file_system_config != null ? [jupyter_lab_image_config.value.file_system_config] : []
        content {
          default_gid = file_system_config.value.default_gid
          default_uid = file_system_config.value.default_uid
          mount_path  = file_system_config.value.mount_path
        }
      }
    }
  }

  dynamic "kernel_gateway_image_config" {
    for_each = each.value.kernel_gateway_image_config != null ? [each.value.kernel_gateway_image_config] : []
    content {
      dynamic "file_system_config" {
        for_each = kernel_gateway_image_config.value.file_system_config != null ? [kernel_gateway_image_config.value.file_system_config] : []
        content {
          default_gid = file_system_config.value.default_gid
          default_uid = file_system_config.value.default_uid
          mount_path  = file_system_config.value.mount_path
        }
      }
      dynamic "kernel_spec" {
        for_each = kernel_gateway_image_config.value.kernel_spec
        content {
          display_name = kernel_spec.value.display_name
          name         = kernel_spec.value.name
        }
      }
    }
  }
}

