default:
    @just --list

# Auto-format source tree
fmt:
    treefmt

# 'cargo run'
clean:
    cargo clean
    cargo clean --release

# 'cargo run'
run *ARGS:
    cargo run --quiet -- {{ARGS}}

# 'cargo watch' (auto-recompiles)
watch *ARGS:
    cargo watch --exec "run --quiet -- {{ARGS}}"
