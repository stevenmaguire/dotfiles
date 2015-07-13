# Create environment
mkdir -p $HOME/.go
mkdir -p $HOME/.go/bin
mkdir -p $HOME/.go/pkg
mkdir -p $HOME/.go/src/github.com

# Install Components
brew install go
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
go get -u github.com/gpmgo/gopm
