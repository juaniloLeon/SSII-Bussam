package objetoscrm;

public class Conductor {

	String nombre;
	String dni;
	String fecha;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public Conductor(String nombre, String dni, String fecha) {
		super();
		this.nombre = nombre;
		this.dni = dni;
		this.fecha = fecha;
	}
}
