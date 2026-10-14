# Root Justfile for sre-testing-suite

list:
    just -l

# Run symlink safety checks (no circular/broken symlinks, no .md/.sh/.rb symlinks) and bash syntax checks
test:
    cd test-scenarios/microservices-demo-gke && just test
