function __print_fortune_functions_help() {
cat <<EOF
Additional Paranoid Android functions:
- clodiff:         Utility to diff CLO history to FortuneOS.
- clomerge:        Utility to merge CLO tags.
- sort-blobs-list: Sort proprietary-files.txt sections with LC_ALL=C.
EOF
}

function clodiff()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/fortune/build/tools/diff-clo.py $target_branch
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
