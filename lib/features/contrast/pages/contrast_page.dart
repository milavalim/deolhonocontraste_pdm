import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/wcag_constants.dart';
import '../../../core/utils/contrast_utils.dart';
import '../widgets/contrast_form.dart';
import '../widgets/contrast_preview.dart';
import '../widgets/wcag_badge.dart';

class ContrastPage extends StatefulWidget {
  const ContrastPage({super.key});

  @override
  State<ContrastPage> createState() => _ContrastPageState(); // Crie o estado para a página de contraste
}

class _ContrastPageState extends State<ContrastPage> {
  final TextEditingController _bgController = TextEditingController(
    text: '#FFFDE7',
  ); // Inicializa o controlador de texto com a cor de fundo padrão (Amarelo Claro)
  final TextEditingController _fgController = TextEditingController(
    text: '#004D40',
  );

  Color _backgroundColor = AppColors.lightYellow;
  Color _foregroundColor = AppColors.tealBlue;
  double _contrastRatio = 0.0; // Inicializa a razão de contraste com 0.0

  @override
  void initState() {
    super.initState();
    _calculateContrast(); // Calcula a razão de contraste inicial com as cores padrão
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceAll('#', ''); // Remove o caractere '#' se estiver presente
    if (hex.length == 6)
      hex =
          'FF$hex'; // Adiciona o valor de opacidade (FF) se não estiver presente
    try {
      return Color(
        int.parse(hex, radix: 16),
      ); // Converte a string hexadecimal para um valor inteiro e cria uma cor
    } catch (e) {
      return Colors.grey;
    }
  }

  void _calculateContrast() {
    setState(() {
      _backgroundColor = _hexToColor(_bgController.text);
      _foregroundColor = _hexToColor(_fgController.text);
      _contrastRatio = ContrastUtils.calculateContrastRatio(
        // Calcula a razão de contraste usando as cores de fundo e primeiro plano
        _backgroundColor,
        _foregroundColor,
      );
    }); // Atualiza o estado com as novas cores e a razão de contraste calculada
  }

  @override
  Widget build(BuildContext context) {
    // usa-se Scaffold para que ele herde o background do tema global.
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.contrastTitle),
        // Removido o botão de voltar pois agora a navegação é por abas
        automaticallyImplyLeading: false,
      ),
      // SingleChildScrollView resolve o erro de "BOTTOM OVERFLOW".
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Prévia Visual',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.tealBlue,
              ),
            ),
            const SizedBox(height: 12),
            ContrastPreview(
              backgroundColor: _backgroundColor,
              foregroundColor: _foregroundColor,
            ),

            const SizedBox(height: 24),

            // Card de Resultado (Usando cores do tema)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.tealBlue.withOpacity(0.1),
                ), // Borda sutil para o card
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Espaço entre o texto e o valor da razão de contraste
                    children: [
                      const Text(
                        AppStrings.contrastRatio,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        _contrastRatio.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.tealBlue,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      WcagBadge(
                        // Badge para AA
                        label: 'AA',
                        isPassed: _contrastRatio >= WcagConstants.minContrastAA,
                      ),
                      WcagBadge(
                        label: 'AAA',
                        isPassed:
                            _contrastRatio >= WcagConstants.minContrastAAA,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Formulário
            ContrastForm(
              bgController: _bgController,
              fgController: _fgController,
              onCalculate: _calculateContrast,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
