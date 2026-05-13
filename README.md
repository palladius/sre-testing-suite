# Overview
This repository hosts the test scenarios for testing  is used for testing the **`sre-gemini-cli-extension`** https://github.com/gemini-cli-extensions/sre repository. 

## Setup

This repo contains:

```bash
$ tree -L 2 
[...]
├── bin/                              # Set up scripts
├── test-scenarios/                   # Test scenarios for various services
  ├── microservices-demo-gke          # Breakage scenarips for microservices online-boutique application using gke
    ├── investigation-prompts/        # This is where you have prompts for testing sre-gemini-cli-extension
       └── README.md                  # Details and fixes for the breakage scenarios
       └── 00-setup.md                # Initial mcp servers setup 
       └── 01-start-investigation.md  # Initiate investigation prompts
       └── 02-generate-postmortem.md  # Generate postmortem prompts 
       └── 03-generate-graph.md       # Generate incident graphs prompts
    ├── breakage-scenarios/           # Various types of breakge scenarios to introduce chaos in online-boutique application for gemini-cli-extensions to troubleshoot
       └── breakage-scenario1.sh      # gke-breakage-scenario1
       └── breakage-scenario2.sh      # gke-breakage-scenario2
       └── breakage-scenario3.sh      # gke-breakage-scenario3
│      └── README.md               # Details and fixes for the breakage scenarios
    ├── justfile                # useful setup scripts and execute breakage scenarios
├── README.md                   # This README