function __print_fortune_functions_help() {
cat <<EOF
Additional FortuneOS functions:
- clomerge:        Utility to merge CLO tags.
EOF
}

function clomerge()
{
    T=$(gettop)
    bash $T/vendor/fortune/build/tools/merge-tag.sh $1
}

export SKIP_ABI_CHECKS="true"
