import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;
import javax.swing.border.TitledBorder;

public class EngelliAraclarFrame extends JFrame{

	AracData aracData;
	
	public EngelliAraclarFrame(AracData aracData){
		
		this.aracData = aracData;
		
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
		

        String[] columnNames = {"PLAKA",
                                "ZAMAN"};
 
        Object[][] data = new Object[aracData.info.size()][2];
        
        for(int i=0;i<aracData.info.size();i++){
       		Object[] tmp = {aracData.info.get(i).plaka,aracData.info.get(i).date};
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
