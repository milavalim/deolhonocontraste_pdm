import 'package:flutter/cupertino.dart';
import '../../../core/utils/contrast_utils.dart'; // Importe a classe de utilidades de contraste
import '../../color_blindness/utils/color_blindness_utils.dart';
import '../../color_blindness/widgets/blindness_preview.dart';

class ContrastPage extends StatefulWidget {
  const ContrastPage({super.key});

  @override
  State<ContrastPage> createState() => _ContrastPageState(); // Crie o estado para a página de contraste
}

class _ContrastPageState extends State<ContrastPage> {
  Color color1 = const Color(0xFF000000);
  Color color2 = const Color(0xFFFFFFFF);

  double?
  ratio; // Variável para armazenar a razão de contraste. O ponto de interrogração indica que pode ser nula inicialmente.
  String result =
      ""; // Variável para armazenar o resultado do nível de contraste

  void calculate() {
    // Essa função é void porque ela não retorna nenhum valor, apenas atualiza o estado da página com os resultados do cálculo de contraste.
    final r = ContrastUtils.contrastRatio(
      // ContrastUtils é a classe de utilidades que criamos para calcular o contraste. Estamos chamando a função contrastRatio e passando as duas cores selecionadas pelo usuário.
      color1,
      color2,
    ); // Calcule a razão de contraste usando a função da classe de utilidades

    setState(() {
      ratio = r;
      result = ContrastUtils.getWCAGLevel(
        r,
      ); // getWCAGLevel é outra função da classe de utilidades que determina o nível de contraste (AAA, AA ou Reprovado) com base na razão calculada.
    });
  }

  @override
  Widget build(BuildContext context) {
    // context é um objeto que contém informações sobre a localização da página na hierarquia de widgets, tema, etc. Ele é necessário para construir a interface do usuário e interagir com outros widgets.
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Olho no Contraste"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Cor 1
              _colorBox("Cor 1", color1, (newColor) {
                setState(() => color1 = newColor);
              }),

              const SizedBox(height: 20),

              // Cor 2
              _colorBox("Cor 2", color2, (newColor) {
                setState(() => color2 = newColor);
              }),

              const SizedBox(height: 30),

              CupertinoButton.filled(
                onPressed: calculate,
                child: const Text("Ver contraste"),
              ),

              const SizedBox(height: 30),

              if (ratio != null) ...[
                Text(
                  "Contraste: ${ratio!.toStringAsFixed(2)}", // Exibe a razão de contraste formatada com 2 casas decimais. O ponto de exclamação após ratio indica que estamos certos de que ratio não é nulo nesse ponto, já que só exibimos essa parte da interface se ratio tiver sido calculado.
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Resultado: $result",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 40),

                const Text(
                  "Simulação de Daltonismo",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                BlindnessPreview(
                  title: "Protanopia",
                  background: ColorBlindnessUtils.protanopia(color1),
                  textColor: ColorBlindnessUtils.protanopia(color2),
                ),

                BlindnessPreview(
                  title: "Deuteranopia",
                  background: ColorBlindnessUtils.deuteranopia(color1),
                  textColor: ColorBlindnessUtils.deuteranopia(color2),
                ),

                BlindnessPreview(
                  title: "Tritanopia",
                  background: ColorBlindnessUtils.tritanopia(color1),
                  textColor: ColorBlindnessUtils.tritanopia(color2),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _colorBox(String title, Color color, Function(Color) onChange) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinha os elementos à esquerda
      children: [
        Text(title),
        const SizedBox(height: 10),
        GestureDetector(
          // GestureDetector é um widget que detecta gestos do usuário, como toques. Ele envolve o container que exibe a cor e permite que o usuário toque nele para abrir o seletor de cores.
          onTap: () async {
            final newColor = await showCupertinoModalPopup<Color>(
              // showCupertinoModalPopup é uma função que exibe um modal na parte inferior da tela. O tipo <Color> indica que esperamos que o modal retorne uma cor selecionada pelo usuário.
              context: context,
              builder: (_) => _colorPicker(
                color,
              ), // _colorPicker é uma função que retorna um widget com os controles para selecionar a cor.
            );

            if (newColor != null) {
              onChange(newColor);
            }
          },
          child: Container(
            height: 50,
            width: double.infinity,
            color: color,
          ), // double.infinity faz com que o container ocupe toda a largura disponível. O color do container é definido pela cor atual (color1 ou color2), permitindo que o usuário veja a cor que está selecionada.
        ),
      ],
    );
  }

  Widget _colorPicker(Color currentColor) {
    final int colorValue = currentColor.value;
    double r = ((colorValue >> 16) & 0xFF)
        .toDouble(); // O operador >> é um operador de deslocamento de bits que move os bits para a direita. Nesse caso, estamos movendo os bits 16 posições para a direita para obter o valor do canal vermelho (R).
    double g = ((colorValue >> 8) & 0xFF)
        .toDouble(); // O operador & 0xFF é usado para garantir que apenas os últimos 8 bits sejam considerados, o que nos dá o valor do canal vermelho entre 0 e 255. O resultado é convertido para double para ser usado no slider.
    double b = (colorValue & 0xFF).toDouble();

    return Container(
      height: 300,
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: Column(
        children: [
          _slider(
            "R",
            r,
            (v) => setState(() => r = v),
          ), // _slider é uma função que retorna um widget com um slider para ajustar o valor de cada canal de cor (R, G e B). O slider exibe o valor atual do canal e permite que o usuário ajuste o valor. Quando o valor do slider é alterado, ele atualiza a variável correspondente (r, g ou b) usando setState para garantir que a interface seja atualizada com a nova cor selecionada.
          _slider("G", g, (v) => setState(() => g = v)),
          _slider("B", b, (v) => setState(() => b = v)),
          CupertinoButton(
            child: const Text("Confirmar"),
            onPressed: () {
              Navigator.pop(
                context,
                Color.fromRGBO(
                  r.toInt(),
                  g.toInt(),
                  b.toInt(),
                  1,
                ), // toInt() é usado para converter os valores de r, g e b de double para int, já que a função fromRGBO espera valores inteiros entre 0 e 255. O último parâmetro (1) representa a opacidade da cor, onde 1 significa totalmente opaco. Quando o usuário pressiona o botão "Confirmar", o modal é fechado e a nova cor selecionada é retornada para a função onTap do GestureDetector, que então atualiza a cor correspondente (color1 ou color2) na página principal.
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _slider(String label, double value, Function(double) onChanged) {
    return Column(
      children: [
        Text("$label: ${value.toInt()}"),
        CupertinoSlider(min: 0, max: 255, value: value, onChanged: onChanged),
      ],
    );
  }
}
