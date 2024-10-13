variable "start_port" {
  description = "Starting port number for the range"
  type        = number
}

variable "end_port" {
  description = "Ending port number for the range"
  type        = number
}

variable "ssh_host" {
  description = "SSH host for connecting to the remote server"
  type        = string
}
