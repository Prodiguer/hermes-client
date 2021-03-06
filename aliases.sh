# Set home.
export HERMES_CLIENT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Extend python path.
export PYTHONPATH=$PYTHONPATH:$HERMES_CLIENT_HOME

# Supported commands.
declare -a HERMES_CLIENT_COMMANDS=(
	metrics-add
	metrics-add-batch
	metrics-delete
	metrics-fetch
	metrics-fetch-columns
	metrics-fetch-count
	metrics-fetch-file
	metrics-fetch-setup
	metrics-fetch-list
	metrics-format
	metrics-rename
	metrics-set-hashes
	ops-heartbeat
)

# Create command aliases.
for HERMES_CLIENT_COMMAND in "${HERMES_CLIENT_COMMANDS[@]}"
do
	declare HERMES_CLIENT_JOB=`echo $HERMES_CLIENT_COMMAND | tr '[:upper:]' '[:lower:]' | tr '-' '_'`
	alias hermes-client-$HERMES_CLIENT_COMMAND='python '$HERMES_CLIENT_HOME'/jobs/exec_'$HERMES_CLIENT_JOB'.py'
done

# Unset work vars.
unset HERMES_CLIENT_COMMAND
unset HERMES_CLIENT_COMMANDS
unset HERMES_CLIENT_JOB
