# Create environment
mkdir -p $HOME/Projects/go
mkdir -p $HOME/Projects/go/bin
mkdir -p $HOME/Projects/go/pkg
mkdir -p $HOME/Projects/go/src/github.com/stevenmaguire

# Install Components
brew install go
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
go get -u github.com/gpmgo/gopm
