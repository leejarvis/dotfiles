source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.2.2

# Custom chruby-auto command which uses precmd_functions
# rather than preexec_functions so it doesn't overwrite
# PATH set by an .envrc file.

autoload -U add-zsh-hook

unset RUBY_AUTO_VERSION

function chruby_auto() {
	local dir="$PWD/" version

	until [[ -z "$dir" ]]; do
		dir="${dir%/*}"

		if { read -r version <"$dir/.ruby-version"; } 2>/dev/null || [[ -n "$version" ]]; then
			if [[ "$version" == "$RUBY_AUTO_VERSION" ]]; then return
			else
				RUBY_AUTO_VERSION="$version"
				chruby "$version"
				return $?
			fi
		fi
	done

	if [[ -n "$RUBY_AUTO_VERSION" ]]; then
		chruby_reset
		unset RUBY_AUTO_VERSION
	fi
}

add-zsh-hook precmd chruby_auto
