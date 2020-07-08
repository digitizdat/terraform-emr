# This code requires a few keys to be set in the environment
#ifeq ($(AWS_DEFAULT_REGION),)
#$(error "You must set the AWS_DEFAULT_REGION variable")
#endif
#ifeq ($(AWS_ACCESS_KEY_ID),)
#$(error "You must set the AWS_ACCESS_KEY_ID variable")
#endif
#ifeq ($(AWS_SECRET_ACCESS_KEY),)
#$(error "You must set the AWS_SECRET_ACCESS_KEY variable")
#endif

# Syntax highlighting. MacOS ships with an old version of Bash that doesn't
# support the \e escape so we need to use this other escape sequence.
ifeq ("$(strip $(shell uname))","Darwin")
ESC=\x1B
else
ESC=\e
endif

# These are mainly just used to create a headline for each target so it's a
# little easier to visually sort through the output.
BOLD=$(ESC)[1m
CYAN=$(ESC)[36m
NORMAL=$(ESC)[0m

# You may need to change this to "terraform" or whatever you have your
# Terraform binary named or aliased to on your system. 
TF=tf12

BACKEND=backend.tfvars
TFVARS=my.tfvars

all: init validate terraform destroy clean

init:
	@echo "\n~~~ $(BOLD)$(CYAN)Initializing Terraform$(NORMAL) ~~~"
	rm -rf .terraform
	$(TF) init -backend=true -backend-config=$(BACKEND)

validate:
	@echo "\n~~~ $(BOLD)$(CYAN)Validating Terraform code$(NORMAL) ~~~"
	$(TF) validate

terraform:
	@echo "\n~~~ $(BOLD)$(CYAN)Applying Terraform code$(NORMAL) ~~~"
	$(TF) apply -var-file=$(TFVARS)

destroy:
	@echo "\n~~~ $(BOLD)$(CYAN)Tearing down$(NORMAL) ~~~"
	$(TF) destroy -var-file=$(TFVARS)

clean:
	@echo "\n~~~ $(BOLD)$(CYAN)Cleaning up$(NORMAL) ~~~"
	rm -rf .terraform
	@echo "\n~~~ $(BOLD)$(CYAN)Success!$(NORMAL) ~~~\n"


