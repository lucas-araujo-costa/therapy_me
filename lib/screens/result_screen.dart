import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultScreen extends StatelessWidget {
  final List<_ChartData> chartData = [
    _ChartData('TCC', 60, Colors.blue),
    _ChartData('Psicologia Analítica de Jung', 20, Colors.pink),
    _ChartData('Psicanálise', 20, Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          children: [
            // Título no topo
            const Text(
              'Resultado',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Centraliza o gráfico e os detalhes
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Centraliza no eixo vertical
                children: [
                  // Gráfico Doughnut
                  Container(
                    height: 250,
                    child: SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<_ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper: (_ChartData data, _) => data.color,
                          xValueMapper: (_ChartData data, _) => data.therapy,
                          yValueMapper: (_ChartData data, _) => data.percentage,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Lista com as terapias e porcentagens
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: chartData.map((data) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Bulletpoint colorido
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: data.color,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Nome da terapia com cor e estilo atualizado
                                Text(
                                  data.therapy,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF767676), // Cor #767676
                                  ),
                                ),
                              ],
                            ),
                            // Porcentagem com cor e estilo atualizado
                            Text(
                              '${data.percentage}%',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF404040), // Cor #404040
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Botões Início e Salvar na parte de baixo
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                    Navigator.pushNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0098FF),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Text(
                  'Voltar ao Início',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.therapy, this.percentage, this.color);

  final String therapy;
  final double percentage;
  final Color color;
}
