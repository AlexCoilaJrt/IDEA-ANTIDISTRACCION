import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('las materias del diseño tienen su color', () {
    expect(AppColors.subject('Cálculo I'), AppColors.subjects[0]);
    expect(AppColors.subject('Física II'), AppColors.subjects[1]);
    expect(AppColors.subject('Historia Moderna'), AppColors.subjects[2]);
    expect(AppColors.subject('Inglés'), AppColors.subjects[3]);
    expect(AppColors.subject('  matemáticas '), AppColors.subjects[0]);
  });

  test('mismo nombre, mismo color; vacío usa el índigo', () {
    expect(AppColors.subject('Arte'), AppColors.subject('arte'));
    expect(AppColors.subject(''), AppColors.indigo);
    expect(AppColors.subject(null), AppColors.indigo);
  });

  test('sin choques dentro de una vista y estable con repetidos', () {
    final palette = AppColors.subjectsWithoutClashes([
      'Cálculo',
      'Álgebra', // también azul: recibe otro
      'Cálculo', // repetido: conserva el suyo
    ]);
    expect(palette['Cálculo'], AppColors.subjects[0]);
    expect(palette['Álgebra'], isNot(AppColors.subjects[0]));
    expect(palette, hasLength(2));
  });
}
