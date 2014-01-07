idempotent_path_prepend ()
{
    PATH=${PATH//":$1"/} #delete any instances in the middle or at the end
    PATH=${PATH//"$1:"/} #delete any instances at the beginning
    export PATH="$1:$PATH" #prepend to beginning
}

idempotent_ld_library_path_prepend ()
{
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH//":$1"/} #delete any instances in the middle or at the end
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH//"$1:"/} #delete any instances at the beginning
    export LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH" #prepend to beginning
}
