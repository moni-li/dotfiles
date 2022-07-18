# Postgres server
alias pg_start="pg_ctl -D /usr/local/var/postgres start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop"

# Node Version Switching
alias node16='export PATH="/usr/local/opt/node@16/bin:$PATH"; node -v'
alias node14='export PATH="/usr/local/opt/node@14/bin:$PATH"; node -v'
alias npm7='export PATH="/usr/local/bin/npm:$PATH"; npm -v; node -v'
