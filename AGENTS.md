# Repository Instructions

- Keep all repository content in English. Do not add Portuguese text to source files, comments, documentation, or configuration.
- Before making changes, verify that the Git hook is configured with `git config --get core.hooksPath`. It must return `.githooks`; if it does not, run `make install-hooks`.
- After every change, run `make format` followed by `make check`.
