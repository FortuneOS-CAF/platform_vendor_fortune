function __print_fortune_functions_help() {
cat <<EOF
Additional FortuneOS functions:
- clomerge:        Utility to merge CLO tags.
EOF
}

function clomerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/fortune/build/tools/merge-clo.py $target_branch
}
