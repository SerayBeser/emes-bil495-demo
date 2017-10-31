import java.util.ArrayList;
import java.util.Date;

public class AracData {

	ArrayList<Arac> info;
	
	public AracData(){
		
		info = new ArrayList<>();

	}

	public void addArac(String plaka,Date date){
		info.add(new Arac(plaka,date));
	}
	
}

