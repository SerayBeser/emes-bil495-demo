
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import javax.swing.*;

public class MainFrame extends JFrame{

	ParkData parkData;
	AracData aracData;
	
	public MainFrame(){
		this.setTitle("LOADSTAR PARK SYSTEM"); 
  		this.setSize(640 , 480); 
  		this.setLayout(new BoxLayout(this.getContentPane(), BoxLayout.Y_AXIS)); 
  		
  		parkData = new ParkData();
  		aracData = new AracData();
  		
  		addContents(this.getContentPane());
  	
  		this.setVisible(true); 
  		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
  		
  		while(true){
  			Scanner scan = new Scanner(System.in);
  			String operation = scan.next();
  			
  			if(operation.equals("New")){
  				String plaka = scan.next();
  				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
  				Date date = new Date();
  				aracData.addArac(plaka,date);
  			}else if(operation.equals("Change")){
  				String blok = scan.next();
	  			for(int i=0;i<parkData.info.size();i++)
	  				if(parkData.info.get(i).block.equals(blok))
	  					parkData.info.get(i).isEmpty = !parkData.info.get(i).isEmpty;
	  		}
  		}
  		
	}
	
	public void addContents(Container container){
		
		/* Header */
		JPanel Header = new JPanel();
		//Header.setBounds(0, 120, 1280, 120);
		Header.setPreferredSize(new Dimension(640, 120));
		container.add(Header);
		JLabel headerLabel = new JLabel("LOADSTAR PARK SYSTEM");
		headerLabel.setFont(new Font("Futura",1,48));
		headerLabel.setHorizontalAlignment(SwingConstants.CENTER);
		headerLabel.setVerticalAlignment(SwingConstants.CENTER);
		Header.add(headerLabel);
		
		/* Body */
		JPanel Body = new JPanel();
		
		//Body.setBounds(0, 240, 1280, 600);
		Body.setPreferredSize(new Dimension(640,480));
		Body.setLayout(new BoxLayout(Body,BoxLayout.Y_AXIS));
		container.add(Body);
		
		/* Otopark Durumu */
		ImageIcon parkDurumIcon = createImageIcon("images/otoparkDoluluk2.jpg",80,36);
		JButton parkDurum = new JButton("Otopark Doluluk Durumu",parkDurumIcon);
		parkDurum.setFont(new Font("Futura", Font.PLAIN, 36));
		parkDurum.setAlignmentX(Component.CENTER_ALIGNMENT);
		parkDurum.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				new ParkDurumFrame(parkData);				
			}
		});
		
		
		/* Engelli Araclar */
		ImageIcon engelliIcon = createImageIcon("images/engelli2.png", 36, 36);
		JButton engelliAraclar = new JButton("Engelli Araçlar",engelliIcon);
		engelliAraclar.setFont(new Font("Futura", Font.PLAIN, 36));
		engelliAraclar.setAlignmentX(Component.CENTER_ALIGNMENT);
		engelliAraclar.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				new EngelliAraclarFrame(aracData);
				
			}
		});
		
		Body.add(parkDurum);
		Body.add(engelliAraclar);
		
	}
	
	public ImageIcon createImageIcon(String path,int width,int height){
		ImageIcon icon = new ImageIcon(path);
		Image img = icon.getImage().getScaledInstance(width,height, java.awt.Image.SCALE_SMOOTH);
		return new ImageIcon(img);
	}
	
	
	
}
