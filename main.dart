import 'dart:io';

class Produtos {
  String? nome;
  double? preco;

  Produtos({this.nome, this.preco});
}

void listaProdutos(List<Produtos> produtos, qtd) {
  print("\nProdutos disponíveis:");
  for (var i = 0; i < qtd; i++) {
    print(
        'ID: ${(i + 1)} - Nome: ${produtos[i].nome} - Valor ${produtos[i].preco}');
  }
}

void cadastraValor(List<Produtos> produtos, qtd) {
  print("Cadastro de Preços:\n");
  for (var x = 0; x < qtd; x++) {
    print('Selecione o valor do produto ${produtos[x].nome}:\n');
    double? valor = double.parse(stdin.readLineSync()!);
    produtos[x].preco = valor;
  }
}

void efetuarCompra(List<Produtos> produto, qtd) {
  int opc = 1;
  double compra = 0;

  while (opc != 999) {
    print("Selecione o produto que deseja comprar:\n");
    listaProdutos(produto, qtd);

    opc = int.parse(stdin.readLineSync()!);
    print(opc);
    opc -= 1;
    compra = (produto[opc].preco! + compra);

    print("Adicionar mais algum produto?\n1-Sim\n2-Não");
    opc = int.parse(stdin.readLineSync()!);

    print(opc);

    if (opc == 2) {
      opc = 999;
    }
  }

  print('Sua compra deu um total de R${compra}');
}

void main() {
  List<Produtos> produto = [
    Produtos(nome: 'Livro', preco: 0),
    Produtos(nome: 'Caneta', preco: 0),
    Produtos(nome: 'Caderno', preco: 0),
    Produtos(nome: 'Lápis', preco: 0),
    Produtos(nome: 'Borracha', preco: 0),
  ];

  int qtd = 5;
  int opc = 999;

  while (opc != 0) {
    print(
        "\nBem vindo ao sistema de venda de produtos:\n1-Exibir Produtos\n2-Cadastrar Preços\n3-Efetuar Compra\n0-Sair");
    opc = int.parse(stdin.readLineSync()!);

    switch (opc) {
      case 0:
        print("Programa Finalizado");
        break;

      case 1:
        listaProdutos(produto, qtd);
        break;

      case 2:
        cadastraValor(produto, qtd);
        break;

      case 3:
        efetuarCompra(produto, qtd);
        break;

      default:
        print("Opção Inválida!\nTente novamente");
    }
  }
}
