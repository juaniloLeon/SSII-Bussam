package objetoscrm;

public class turno {

	String cad1;
	String cad2;
	String cad3;
	String cad4;
	public String getCad1() {
		return cad1;
	}
	public void setCad1(String cad1) {
		this.cad1 = cad1;
	}
	public String getCad2() {
		return cad2;
	}
	public void setCad2(String cad2) {
		this.cad2 = cad2;
	}
	public String getCad3() {
		return cad3;
	}
	public void setCad3(String cad3) {
		this.cad3 = cad3;
	}
	public String getCad4() {
		return cad4;
	}
	public void setCad4(String cad4) {
		this.cad4 = cad4;
	}
	public turno(String cad1, String cad2, String cad3, String cad4) {
 		this.cad1 = cad1;
		this.cad2 = cad2;
		this.cad3 = cad3;
		this.cad4 = cad4;
	}
	 
	public turno( ) {
 		this.cad1 = "";
		this.cad2 = "";
		this.cad3 = "";
		this.cad4 = "";
	}
 
}
