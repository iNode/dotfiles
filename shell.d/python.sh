
# python easy-install shorcut
alias e-i='easy_install -d ~/.python/lib -s ~/.python/bin'

# For arbitrary, non-venvwrapper-managed envs
enter() {
    venv_dir="$1"
    [ -n "$venv_dir" ] && [ -d "$venv_dir" ] || return
    # shellcheck disable=SC1090
    . "${venv_dir}/bin/activate";
}

# environment variables
# prevent global package installation
export PIP_REQUIRE_VIRTUALENV=true
alias gpip='PIP_REQUIRE_VIRTUALENV="" pip'
