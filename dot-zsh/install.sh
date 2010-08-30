#!/bin/bash

if [ -z $1 ]; then
  INSTALL_DIR=${HOME}
else
  INSTALL_DIR=${1}
fi
echo "Installing to ${INSTALL_DIR}..."

if [ ! -d ${INSTALL_DIR}/.zsh ]; then
  mkdir ${INSTALL_DIR}/.zsh
fi
cp -f zlogin zshenv zshrc zshcomp ${INSTALL_DIR}/.zsh
if [ ! -d ${INSTALL_DIR}/.zsh/functions ]; then
  mkdir ${INSTALL_DIR}/.zsh/functions
fi
pushd functions
cp $(find . -type f | grep -v .svn) ${INSTALL_DIR}/.zsh/functions
popd

if [ ! -d ${INSTALL_DIR}/.zsh/lib ]; then
  mkdir ${INSTALL_DIR}/.zsh/lib
fi
pushd lib
cp $(find . -type f | grep -v .svn) ${INSTALL_DIR}/.zsh/lib
popd

if [ ! -f ${INSTALL_DIR}/.zlogin ];then
  ln -snf ${INSTALL_DIR}/.zsh/zlogin ${INSTALL_DIR}/.zlogin
fi

if [ ! -f ${INSTALL_DIR}/.zshenv ]; then
  ln -snf ${INSTALL_DIR}/.zsh/zshenv ${INSTALL_DIR}/.zshenv
fi

if [ ! -f ${INSTALL_DIR}/.zshrc ]; then
  ln -snf ${INSTALL_DIR}/.zsh/zshrc ${INSTALL_DIR}/.zshrc
fi

if [ ! -f ${INSTALL_DIR}/.zsh/zshcomp ]; then
  touch ${INSTALL_DIR}/.zsh/zshcomp
fi

if [ ! -f ${INSTALL_DIR}/.zshcomp ]; then
  ln -snf ${INSTALL_DIR}/.zsh/zshcomp ${INSTALL_DIR}/.zshcomp
fi
