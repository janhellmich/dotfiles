function mkcdir()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

function mltremote() 
{
  dir=${PWD##*/}
  dir_path="~/ml4t/$dir"
  ssh buffet "mkdir -p $dir_path"
  scp *.py buffet:"$dir_path/."
  echo "============================== running on server ==============================="
  ssh buffet "export PYTHONPATH='../:.'; cd ml4t/$dir; python $1" 
}

function dcl() 
{
  docker-compose -f local.yml $@ 
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# Compare original and gzipped file size
function gz() {
	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	printf "orig: %d bytes\n" "$origsize";
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}
