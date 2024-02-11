# prints this menu
default:
    @just --list

# format source tree
fmt:
    treefmt

# clean project via 'cargo clean'
clean:
    cargo clean
    cargo clean --release

# run project via 'cargo run'
run *ARGS:
    cargo run --quiet -- {{ARGS}}

# 'cargo watch' (auto-recompiles)
watch *ARGS:
    cargo watch --exec "run --quiet -- {{ARGS}}"
