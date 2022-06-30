import 'dart:io';

void listaProdutos(List<String> produtos, qtd) {
  print("\nProdutos disponíveis:");
  for (var i = 0; i < qtd; i++) {
    print('${(i + 1)} - ${produtos[i]}');
  }
}

void listaProdutosCValor(List<String> produtos, List<double> valores, qtd){
  print("\nProdutos disponíveis:");
  for (var i = 0; i < 5; i++) {
    print('${(i + 1)} - ${produtos[i]} - ${valores[i]}');
  }
}

void cadastraValor(List<double> valores, List<String> produtos, qtd) {
  print("Cadastro de Preços:\n");
  for (var x = 0; x < qtd; x++) {
    print('Selecione o valor do produto ${produtos[x]}:\n');
    double? valor = double.parse(stdin.readLineSync()!);
    valores.insert(x, valor);
  }
}

void efetuarCompra(List<double> valores, List<String> produtos, qtd) {
  int opc = 1;
  int count = 0;
  double compra = 0;
  List<String> historico = [];

  while (opc != 999) {
    print("Selecione o produto que deseja comprar:\n");
    listaProdutosCValor(produtos, valores, qtd);

    opc = int.parse(stdin.readLineSync()!);
    print(opc);

    compra = valores[opc] + compra;
    historico.insert(count, produtos[opc]);

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
  int qtd = 5;
  List<String> produtos = [
    "Livro",
    "Caneta",
    "Caderno",
    "Lápis",
    "Borracha",
  ];
  List<double> valores = [5];

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
        listaProdutos(produtos, qtd);
        break;

      case 2:
        cadastraValor(valores, produtos, qtd);
        break;

      case 3:
        efetuarCompra(valores, produtos, qtd);
        break;

      default:
        print("Opção Inválida!\nTente novamente");
    }
  }
}
