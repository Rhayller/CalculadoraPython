#!/bin/bash

# Projeto Calculadora em Shell Script

while true; do
  echo "Escolha uma operação:"
  echo "1 - Adição"
  echo "2 - Subtração"
  echo "3 - Multiplicação"
  echo "4 - Divisão"
  echo "5 - Sair"

  read -p "Digite sua escolha (1-5): " opcao

  if [[ ! "$opcao" =~ ^[1-5]$ ]]; then
    echo "Entrada inválida. Por favor, insira um número entre 1 e 5."
    continue
  fi

  if [[ "$opcao" -eq 5 ]]; then
    echo "Saindo da calculadora..."
    break
  fi

  read -p "Digite o primeiro número: " num1
  read -p "Digite o segundo número: " num2

  if [[ ! "$num1" =~ ^[0-9]+([.][0-9]+)?$ || ! "$num2" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Entrada inválida. Por favor, insira números válidos."
    continue
  fi

  case "$opcao" in
    1) resultado=$(echo "$num1 + $num2" | bc) ;;
    2) resultado=$(echo "$num1 - $num2" | bc) ;;
    3) resultado=$(echo "$num1 * $num2" | bc) ;;
    4) 
      if [[ "$num2" -eq 0 ]]; then
        echo "Erro: Divisão por zero!"
      else
        resultado=$(echo "scale=2; $num1 / $num2" | bc) 
      fi
      ;;
  esac

  echo "O resultado é: $resultado"

done
