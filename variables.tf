variable "sagemaker_app_image_configs" {
  description = <<EOT
Map of sagemaker_app_image_configs, attributes below
Required:
    - app_image_config_name
Optional:
    - region
    - tags
    - tags_all
    - code_editor_app_image_config (block):
        - container_config (optional, block):
            - container_arguments (optional)
            - container_entrypoint (optional)
            - container_environment_variables (optional)
        - file_system_config (optional, block):
            - default_gid (optional)
            - default_uid (optional)
            - mount_path (optional)
    - jupyter_lab_image_config (block):
        - container_config (optional, block):
            - container_arguments (optional)
            - container_entrypoint (optional)
            - container_environment_variables (optional)
        - file_system_config (optional, block):
            - default_gid (optional)
            - default_uid (optional)
            - mount_path (optional)
    - kernel_gateway_image_config (block):
        - file_system_config (optional, block):
            - default_gid (optional)
            - default_uid (optional)
            - mount_path (optional)
        - kernel_spec (required, block):
            - display_name (optional)
            - name (required)
EOT

  type = map(object({
    app_image_config_name = string
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    code_editor_app_image_config = optional(object({
      container_config = optional(object({
        container_arguments             = optional(list(string))
        container_entrypoint            = optional(list(string))
        container_environment_variables = optional(map(string))
      }))
      file_system_config = optional(object({
        default_gid = optional(number)
        default_uid = optional(number)
        mount_path  = optional(string)
      }))
    }))
    jupyter_lab_image_config = optional(object({
      container_config = optional(object({
        container_arguments             = optional(list(string))
        container_entrypoint            = optional(list(string))
        container_environment_variables = optional(map(string))
      }))
      file_system_config = optional(object({
        default_gid = optional(number)
        default_uid = optional(number)
        mount_path  = optional(string)
      }))
    }))
    kernel_gateway_image_config = optional(object({
      file_system_config = optional(object({
        default_gid = optional(number)
        default_uid = optional(number)
        mount_path  = optional(string)
      }))
      kernel_spec = list(object({
        display_name = optional(string)
        name         = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.kernel_gateway_image_config == null || (length(v.kernel_gateway_image_config.kernel_spec) >= 1 && length(v.kernel_gateway_image_config.kernel_spec) <= 5)
      )
    ])
    error_message = "Each kernel_spec list must contain between 1 and 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        (length(v.app_image_config_name) >= 1 && length(v.app_image_config_name) <= 63) && (can(regex("^[0-9A-Za-z](-*[0-9A-Za-z])*$", v.app_image_config_name)))
      )
    ])
    error_message = "all of: must be between 1 and 63 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.code_editor_app_image_config == null || (v.code_editor_app_image_config.file_system_config == null || (v.code_editor_app_image_config.file_system_config.default_gid == null || (contains([0, 100], v.code_editor_app_image_config.file_system_config.default_gid))))
      )
    ])
    error_message = "must be one of: 0, 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.code_editor_app_image_config == null || (v.code_editor_app_image_config.file_system_config == null || (v.code_editor_app_image_config.file_system_config.default_uid == null || (contains([0, 1000], v.code_editor_app_image_config.file_system_config.default_uid))))
      )
    ])
    error_message = "must be one of: 0, 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.code_editor_app_image_config == null || (v.code_editor_app_image_config.file_system_config == null || (v.code_editor_app_image_config.file_system_config.mount_path == null || ((length(v.code_editor_app_image_config.file_system_config.mount_path) >= 1 && length(v.code_editor_app_image_config.file_system_config.mount_path) <= 1024) && (can(regex("^\\/.*", v.code_editor_app_image_config.file_system_config.mount_path))))))
      )
    ])
    error_message = "all of: must be between 1 and 1024 characters; Must start with `/`."
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.jupyter_lab_image_config == null || (v.jupyter_lab_image_config.file_system_config == null || (v.jupyter_lab_image_config.file_system_config.default_gid == null || (contains([0, 100], v.jupyter_lab_image_config.file_system_config.default_gid))))
      )
    ])
    error_message = "must be one of: 0, 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.jupyter_lab_image_config == null || (v.jupyter_lab_image_config.file_system_config == null || (v.jupyter_lab_image_config.file_system_config.default_uid == null || (contains([0, 1000], v.jupyter_lab_image_config.file_system_config.default_uid))))
      )
    ])
    error_message = "must be one of: 0, 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.jupyter_lab_image_config == null || (v.jupyter_lab_image_config.file_system_config == null || (v.jupyter_lab_image_config.file_system_config.mount_path == null || ((length(v.jupyter_lab_image_config.file_system_config.mount_path) >= 1 && length(v.jupyter_lab_image_config.file_system_config.mount_path) <= 1024) && (can(regex("^\\/.*", v.jupyter_lab_image_config.file_system_config.mount_path))))))
      )
    ])
    error_message = "all of: must be between 1 and 1024 characters; Must start with `/`."
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.kernel_gateway_image_config == null || (v.kernel_gateway_image_config.file_system_config == null || (v.kernel_gateway_image_config.file_system_config.default_gid == null || (contains([0, 100], v.kernel_gateway_image_config.file_system_config.default_gid))))
      )
    ])
    error_message = "must be one of: 0, 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.kernel_gateway_image_config == null || (v.kernel_gateway_image_config.file_system_config == null || (v.kernel_gateway_image_config.file_system_config.default_uid == null || (contains([0, 1000], v.kernel_gateway_image_config.file_system_config.default_uid))))
      )
    ])
    error_message = "must be one of: 0, 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_app_image_configs : (
        v.kernel_gateway_image_config == null || (v.kernel_gateway_image_config.file_system_config == null || (v.kernel_gateway_image_config.file_system_config.mount_path == null || ((length(v.kernel_gateway_image_config.file_system_config.mount_path) >= 1 && length(v.kernel_gateway_image_config.file_system_config.mount_path) <= 1024) && (can(regex("^\\/.*", v.kernel_gateway_image_config.file_system_config.mount_path))))))
      )
    ])
    error_message = "all of: must be between 1 and 1024 characters; Must start with `/`."
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

