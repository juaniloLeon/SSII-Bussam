package objetoscrm;

public class Linea {

	int parada;
	String paradaSiguiente;
	String direccion;

	public int getParada() {
		return parada;
	}

	public void setParada(int parada) {
		this.parada = parada;
	}

	public String getParadaSiguiente() {
		return paradaSiguiente;
	}

	public void setParadaSiguiente(String paradaSiguiente) {
		this.paradaSiguiente = paradaSiguiente;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Linea(int parada, String paradaSiguiente, String direccion) {
		super();
		this.parada = parada;

		if (paradaSiguiente.equals(""))
			this.paradaSiguiente = "terminal";
		else
			this.paradaSiguiente = paradaSiguiente;
		this.direccion = direccion;
	}

}
