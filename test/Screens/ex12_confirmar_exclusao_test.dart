import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sl3v1_flutter/Screens/exercicio_12_pag_conf.dart';

void main() {
  testWidgets('Exibir tela de confirmação', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: ConfirmarExclusao(pessoa: 'João', aoDeletar: () {})));
    expect(find.text('Confirmar Exclusão'), findsOneWidget);
    expect(find.text('Deseja excluir João?'), findsOneWidget);
    expect(find.text('Sim, excluir'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);
  });
  testWidgets('Clicar no botão "Sim, excluir"', (WidgetTester tester) async {
    bool deletado = false;
    await tester.pumpWidget(MaterialApp(
      home: ConfirmarExclusao(
        pessoa: 'Maria',
        aoDeletar: () {
          deletado = true;
        },
      ),
    ));
    await tester.tap(find.text('Sim, excluir'));
    await tester.pump();
    expect(deletado, isTrue);
  });
  testWidgets('Clicar no botão "Cancelar"', (WidgetTester tester) async {
    bool deletado = false;
    await tester.pumpWidget(MaterialApp(
      home: ConfirmarExclusao(
        pessoa: 'Pedro',
        aoDeletar: () {
          deletado = true;
        },
      ),
    ));
    await tester.tap(find.text('Cancelar'));
    await tester.pump();
    expect(deletado, isFalse);
  });
}
