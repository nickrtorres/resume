#!/bin/sh

set -eu

TEX_ARCHIVE="install-tl-unx.tar.gz"

fail()
{
  echo "fatal: $*" >&1
  exit 1
}

checkdep()
{
  if ! command -v "$1"; then
    fail "$1 is not installed"
  fi
}

checkdep perl
checkdep wget
checkdep tar

tmpdir=$(mktemp -d)

(
  cd "$tmpdir"
  curl -L https://cpanmin.us | perl - --sudo App::cpanminus
  wget "http://mirror.ctan.org/systems/texlive/tlnet/${TEX_ARCHIVE}" || fail "cannot wget tex archive"
  tar xf "$TEX_ARCHIVE" || fail "cannot untar tex archive"
  cd install-tl-20*
  perl install-tl -profile=/opt/texlive/texlive.profile || fail "the tex installer failed"
  tlmgr paper letter
)
