import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;
import javax.swing.border.TitledBorder;

public class ParkDurumFrame extends JFrame{

	ParkData parkData;
	Object[][] dataVector;
	
	public ParkDurumFrame(ParkData parkData){
		
		this.parkData = parkData;
		
		this.setTitle("LOADSTAR PARK SYSTEM"); 
  		this.setSize(640 , 480); 
  		this.setLayout(new BoxLayout(this.getContentPane(),BoxLayout.Y_AXIS));
  		
  		fillGrid();
  		
  		/* Refresh Durumu */
		/*ImageIcon refreshIcon = createImageIcon("images/refresh.jpg",80,36);
		JButton refresh = new JButton("Yenile",refreshIcon);
		refresh.setFont(new Font("Futura", Font.PLAIN, 36));
		refresh.setAlignmentX(Component.CENTER_ALIGNMENT);
		refresh.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				fillGrid();				
			}
		});
		add(refresh);*/
  		
  		this.setVisible(true); 
		
	}
	
	public void fillGrid(){
		

        String[] columnNames = {"BLOK",
                                "UZAKLIK",
                                "DURUM"};
 
        Object[][] data = new Object[parkData.info.size()][4];
        
        for(int i=0;i<parkData.info.size();i++){
        	
        	String durum;
        	if(parkData.info.get(i).isEmpty)
        		durum = "BOS";
        	else durum = "DOLU";
       		Object[] tmp = {parkData.info.get(i).block,new Integer(parkData.info.get(i).distance),durum,"Degistir"};
       		data[i] = tmp;
        }
        
        final JTable table = new JTable(data, columnNames);
        table.setPreferredScrollableViewportSize(new Dimension(500, 70));
        table.setFillsViewportHeight(true);
  
        //Create the scroll pane and add the table to it.
        JScrollPane scrollPane = new JScrollPane(table);
 
        //Add the scroll pane to this panel.
        add(scrollPane);
        
	}
	
	public ImageIcon createImageIcon(String path,int width,int height){
		ImageIcon icon = new ImageIcon(path);
		Image img = icon.getImage().getScaledInstance(width,height, java.awt.Image.SCALE_SMOOTH);
		return new ImageIcon(img);
	}
	
}
