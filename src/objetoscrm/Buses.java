package objetoscrm;

public class Buses {

	int id;
	String matricula;
	public int getID() {
		return id;
	}
	public void setID(int id) {
		this.id = id;
	}
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public Buses(int id, String matricula) {
		super();
		this.id = id;
		this.matricula = matricula;
	}
	
	
	
}
