package objetoscrm;

public class Recorridos {

	private int linea;
	private int parada;	
	private String paradasiguiente;

	public int getLinea() {
		return linea;
	}

	public void setLinea(int linea) {
		this.linea = linea;
	}

	public int getParada() {
		return parada;
	}

	public void setParada(int parada) {
		this.parada = parada;
	}

	public String getParadasiguiente() {
		return paradasiguiente;
	}

	public void setParadasiguiente(String paradasiguiente) {
		this.paradasiguiente = paradasiguiente;
	}


	public Recorridos(int linea, int parada, String paradasiguiente) {
		super();
		this.linea = linea;
		this.parada = parada;
		if (paradasiguiente != "")
			this.paradasiguiente = paradasiguiente;
		else
			this.paradasiguiente="Terminal";
	}

 

 
	
}

