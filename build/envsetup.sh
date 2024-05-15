function __print_fortune_functions_help() {
cat <<EOF
Additional functions:
- mka:             Builds using all available CPUs
- brunch:          Lunch + mka in one command
- clomerge:        Utility to merge CLO tags.
- getfortune:      Lunch + mka in one command
- sort-blobs-list: Sort proprietary-files.txt sections with LC_ALL=C.
EOF
}

# Make using all available CPUs
function mka() {
    m "$@"
}

function brunch()
{
    lunch $1-userdebug
    if [ $? -eq 0 ]; then
        time m fortune
    else
        echo "Lunch failed!"
        return 1
    fi
    return $?
}

function getfortune()
{
    source build/envsetup.sh
    lunch fortune_$1
    if [ $? -eq 0 ]; then
        time mka fortune
    else
        echo "Lunch failed!"
        return 1
    fi
    return $?
}

function clomerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/fortune/build/tools/merge-clo.py $target_branch
}

function sort-blobs-list() {
    T=$(gettop)
    $T/tools/extract-utils/sort-blobs-list.py $@
}

export SKIP_ABI_CHECKS="true"

# check and set ccache path on envsetup
if [ -z "${CCACHE_EXEC}" ]; then
    if command -v ccache &>/dev/null; then
        export USE_CCACHE=1
        export CCACHE_EXEC=$(command -v ccache)
        [ -z "${CCACHE_DIR}" ] && export CCACHE_DIR="$HOME/.ccache"
        echo "ccache directory found, CCACHE_DIR set to: $CCACHE_DIR" >&2
        CCACHE_MAXSIZE="${CCACHE_MAXSIZE:-40G}"
        DIRECT_MODE="${DIRECT_MODE:-false}"
        $CCACHE_EXEC -o compression=true -o direct_mode="${DIRECT_MODE}" -M "${CCACHE_MAXSIZE}" \
            && echo "ccache enabled, CCACHE_EXEC set to: $CCACHE_EXEC, CCACHE_MAXSIZE set to: $CCACHE_MAXSIZE, direct_mode set to: $DIRECT_MODE" >&2 \
            || echo "Warning: Could not set cache size limit. Please check ccache configuration." >&2
        CURRENT_CCACHE_SIZE=$(du -sh "$CCACHE_DIR" 2>/dev/null | cut -f1)
        if [ -n "$CURRENT_CCACHE_SIZE" ]; then
            echo "Current ccache size is: $CURRENT_CCACHE_SIZE" >&2
        else
            echo "No cached files in ccache." >&2
        fi
    else
        echo "Error: ccache not found. Please install ccache." >&2
    fi
fi
