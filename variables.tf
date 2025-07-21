variable "Eth0PrivateIpAddress" {
	default = "10.0.10.11"
	type = string
}

variable "Eth0SubnetName" {
	description = "Name of the subnet associated with the first network interface"
	type = string
}

variable "Eth0VpcNetworkName" {
	description = "Name of the virtual private cloud associated with the first network interface"
	type = string
}

variable "Eth1PrivateIpAddress" {
	default = "10.0.2.15"
	type = string
}

variable "Eth1PrivateIpAliases" {
	default = "/28"
	type = string
}

variable "Eth1SubnetName" {
	description = "Name of the subnet associated with the second network interface"
	type = string
}

variable "Eth1VpcNetworkName" {
	description = "Name of the virtual private cloud associated with the second network interface"
	type = string
}

variable "Eth2PrivateIpAddress" {
	default = "10.0.3.15"
	type = string
}

variable "Eth2PrivateIpAliases" {
	default = "/28"
	type = string
}

variable "Eth2SubnetName" {
	description = "Name of the subnet associated with the third network interface"
	type = string
}

variable "Eth2VpcNetworkName" {
	description = "Name of the virtual private cloud associated with the third network interface"
	type = string
}

variable "InstanceId" {
	default = "app"
	description = "Id of the instance of this module that ensures uniqueness"
	type = string
}

variable "MachineType" {
	default = "c4-standard-8"
	description = "Designation for set of resources available to VM"
	type = string
	validation {
		condition = contains([ "c4-standard-8", "c4-standard-48", "c4-standard-96", "c4-standard-192" ], var.MachineType)
		error_message = <<EOF
MachineType must be one of the following types:
	c4-standard-8, c4-standard-48, c4-standard-96, c4-standard-192
		EOF
	}
}

variable "MarketplaceImageName" {
	default = "ixia-cloud-test-appliance-11-00-4444-444"
	description = "Identifier for image"
	type = string
}

variable "MarketplaceImageProjectId" {
	default = "mpi-keysight-public"
	description = "Globally unique identifier for image source project"
	type = string
}

variable "NetworkTargetTags" {
	default = [
		"ixnetwork-app"
	]
	description = "Network tags make firewall rules and routes applicable to specific VM instances."
	type = list(string)
}

variable "RegionName" {
	default = "us-central1"
	description = "Geographical location where resources can be hosted" 
	type = string
}

variable "SleepDelay" {
	default = "4m"
	description = "Time duration to delay to allow application to perform internal initialization required before use"
	type = string
}

variable "Tag" {
	default = "ixnetwork"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "TotalEgressBandwidthTier" {
	default = "DEFAULT"
	description = "Level of egress bandwidth tier associated with this VM instance"
	type = string
	validation {
		condition = contains([ "DEFAULT", "TIER_1" ], var.TotalEgressBandwidthTier)
		error_message = <<EOF
TotalEgressBandwidthTier must be one of the following values:
	DEFAULT, TIER_1
		EOF
	}
}

variable "UserEmailTag" {
	default = "terraform@example.com"
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "module"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "11-00"
	description = "Versioning of the application using the deployment"
	type = string
}

variable "ZoneName" {
	default = "us-central1-a"
	description = "Deployment area within a region"
	type = string
}