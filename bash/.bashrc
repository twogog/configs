alias pull="git pull --rebase"
alias rm="rm -i"
alias apply="git stash apply"
alias pop="git stash pop"

complex=""

__getcomplex() {
   case "$1" in
    "c")
        complex=controller ;;

    "e")
        complex=ecommerce ;;
   esac 
}

upddev() {
  __getcomplex $1
    npm run update-"$complex" development "$2"
}

updprod() {
  __getcomplex
    npm run update-"$complex" production "$2"
}

check() {
    git checkout -b "hot-fix-"$1""
}

names="controller ecommerce administrator"

rundev() {
  for arg in $names; do
    mintty bash -c "npm run dev-$arg" &
  done
    mintty bash -c "npm run dev-rubusiness" &
}

runwatch() {
  for arg in $names; do
    mintty bash -c "npm run watch-$arg" &
  done
}

runall() {
    rundev
    runwatch
}

stash() {
  git stash -u -m "$1"
}