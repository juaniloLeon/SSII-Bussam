package objetoscrm;

public class Fecha {
	int año;
	int mes; // 1 a 12
	int dia; // 1 a 31

	public Fecha(String aux) {
		String[] bux = aux.split("-");

		if (bux.length == 3) {
			año = Integer.parseInt(bux[0]);
			mes = Integer.parseInt(bux[1]);
			dia = Integer.parseInt(bux[2]);

			if (!validaFecha(año, mes, dia)) {
				año = 2018;
				mes = 01;
				dia = 01;
			}

		}

		else {
			año = 2018;
			mes = 01;
			dia = 01;
		}

	}

	@Override
	public String toString() {
		return año+"-"+mes+"-"+dia;
	}

	static int[] diasMes = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

	/**
	 * Comprueba si la fecha es correcta. Se comprueban solo fechas de 1900 o
	 * posteriores.
	 * 
	 * @param fecha
	 *            La fecha a comprobar.
	 * @return true si la fecha es correcta, false en otro caso.
	 * @throws IllegalArgumentException
	 *             si el año es menor que 1900.
	 */
	boolean validaFecha(Fecha fecha) {
		if (fecha.año < 1900) {
			throw new IllegalArgumentException("Solo se comprueban fechas del año 1900 o posterior");
		}
		if (fecha.mes < 1 || fecha.mes > 12)
			return false;
		// Para febrero y bisiesto el limite es 29
		if (fecha.mes == 2 && fecha.año % 4 == 0)
			return fecha.dia >= 1 && fecha.dia <= 29;
		return fecha.dia >= 0 && fecha.dia <= diasMes[fecha.mes - 1];
	}

	boolean validaFecha(int año, int mes, int dia) {
		if (año < 1900) {
			throw new IllegalArgumentException("Solo se comprueban fechas del año 1900 o posterior");
		}
		if (mes < 1 || mes > 12)
			return false;
		// Para febrero y bisiesto el limite es 29
		if (mes == 2 && año % 4 == 0)
			return dia >= 1 && dia <= 29;
		return dia >= 0 && dia <= diasMes[mes - 1];
	}
}