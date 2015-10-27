unset NVM_AUTO_VERSION

function nvm_auto() {
	local dir="$PWD/" version

	until [[ -z "$dir" ]]; do
		dir="${dir%/*}"

		if { read -r version <"$dir/.nvmrc"; } 2>/dev/null || [[ -n "$version" ]]; then
			version="${version%%[[:space:]]}"

			if [[ "$version" == "$NVM_AUTO_VERSION" ]]; then return
			else
				NVM_AUTO_VERSION="$version"
				nvm use "$version"
				return $?
			fi
		fi
	done

	if [[ -n "$NVM_AUTO_RESET" && -n "$NVM_AUTO_VERSION" ]]; then
		nvm use default
		unset NVM_AUTO_VERSION
	fi
}

if [[ -n "$ZSH_VERSION" ]]; then
	if [[ ! "$preexec_functions" == *nvm_auto* ]]; then
		preexec_functions+=("nvm_auto")
	fi
elif [[ -n "$BASH_VERSION" ]]; then
	trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && nvm_auto' DEBUG
fi

