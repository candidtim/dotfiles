# Functions to check and start ssh-agent

SSH_ENV=$HOME/.ssh/environment

function start_agent {
    echo "Initialising new SSH agent..."
    ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > $HOME/devnull
    ssh-add;
}

function is_agent {
    if [ -f "${SSH_ENV}" ]; then
        . ${SSH_ENV} > $HOME/devnull
        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ || {
        echo "ssh-agent not found (no process)";
        return 0;
        }
    else
      echo "ssh-agent not found (no environment)";
        return 0;
    fi
  echo "ssh-agent is on line";
  return 1;
}
