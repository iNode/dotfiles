#!/bin/sh

if which python3 > /dev/null 2>&1; then
    # python based one liners
    urlencode() {
        # encode url
        python3 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])" "$@"
    }
    urldecode() {
        # "decode url"
        python3 -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])" "$@"
    }
    jsont() {
        # "call json tool, and keep keys stable/sorted"
        python3 -m json.tool --sort-keys "$@"
    }
fi



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
