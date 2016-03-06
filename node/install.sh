echo 'Running node installer'

if test ! $(which node); then
  echo '##################'
  echo 'You need node and npm'
  echo 'Install the dependencies and run bootstrap again'
  echo '##################'
else
  echo 'node is already installed'
fi

if test ! $(which eslint); then
  echo 'Installing eslint...'
  npm install eslint -g
else
  echo 'eslint is already installed'
fi
