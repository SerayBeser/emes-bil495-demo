import sqlite3

conn = sqlite3.connect('loadstarParkSystem.db')
c = conn.cursor()

def tablo_olustur_block():
    c.execute("CREATE TABLE IF NOT EXISTS block (block_name text ,ozellik text, yakinlik_derecesi int , durum text) ")

def tablo_olustur_kapi():
    c.execute("CREATE TABLE IF NOT EXISTS kapi (kapi_no int , kat_no int ) ")

def tablo_olustur_giris():
    c.execute("CREATE TABLE IF NOT EXISTS giris (giris_no int , giris_kat_no int ) ")

def tablo_olustur_cikis():
    c.execute("CREATE TABLE IF NOT EXISTS cikis (cikis_no int , cikis_kat_no int ) ")

def insert_block():
    c.execute("INSERT INTO block VALUES('A1','normal', 4 ,'bos')")
    c.execute("INSERT INTO block VALUES('A2','normal', 3 ,'dolu')")
    c.execute("INSERT INTO block VALUES('A3','engelli', 1 ,'dolu')")
    c.execute("INSERT INTO block VALUES('A4','engelli', 1 ,'bos')")
    c.execute("INSERT INTO block VALUES('A5','normal', 1 ,'dolu')")
    c.execute("INSERT INTO block VALUES('A6','normal', 2 ,'dolu')")
    c.execute("INSERT INTO block VALUES('A7','normal', 3 ,'bos')")
    c.execute("INSERT INTO block VALUES('A8','normal', 4 ,'bos')")

    c.execute("INSERT INTO block VALUES('B1','normal', 4 ,'dolu')")
    c.execute("INSERT INTO block VALUES('B2','normal', 3 ,'bos')")
    c.execute("INSERT INTO block VALUES('B3','normal', 2 ,'dolu')")
    c.execute("INSERT INTO block VALUES('B4','normal', 2 ,'bos')")
    c.execute("INSERT INTO block VALUES('B5','normal', 3 ,'dolu')")
    c.execute("INSERT INTO block VALUES('B6','normal', 4 ,'bos')")

    c.execute("INSERT INTO block VALUES('C1','normal', 4 ,'dolu')")
    c.execute("INSERT INTO block VALUES('C2','normal', 3 ,'bos')")
    c.execute("INSERT INTO block VALUES('C3','normal', 2 ,'dolu')")
    c.execute("INSERT INTO block VALUES('C4','normal', 2 ,'bos')")
    c.execute("INSERT INTO block VALUES('C5','normal', 3 ,'dolu')")
    c.execute("INSERT INTO block VALUES('C6','normal', 4 ,'bos')")

    c.execute("INSERT INTO block VALUES('D1','normal', 4 ,'dolu')")
    c.execute("INSERT INTO block VALUES('D2','normal', 3 ,'dolu')")
    c.execute("INSERT INTO block VALUES('D3','normal', 2 ,'bos')")
    c.execute("INSERT INTO block VALUES('D4','normal', 1 ,'bos')")
    c.execute("INSERT INTO block VALUES('D5','engelli', 1 ,'dolu')")
    c.execute("INSERT INTO block VALUES('D6','engelli', 1 ,'dolu')")
    c.execute("INSERT INTO block VALUES('D7','normal', 3 ,'bos')")
    c.execute("INSERT INTO block VALUES('D8','normal', 4 ,'dolu')")

def insert_kapi():   
    c.execute("INSERT INTO kapi VALUES(1 , 1 )")
    c.execute("INSERT INTO kapi VALUES(1 , 2 )")

def insert_giris():   
    c.execute("INSERT INTO giris VALUES(1 , 1 )")
    c.execute("INSERT INTO giris VALUES(1 , 2 )")

def insert_cikis():   
    c.execute("INSERT INTO cikis VALUES(1 , 1 )")
    c.execute("INSERT INTO cikis VALUES(1 , 2 )")

    conn.commit()
    

tablo_olustur_block()
tablo_olustur_kapi()
tablo_olustur_giris()
tablo_olustur_cikis()

insert_block()
insert_kapi()
insert_giris()
insert_cikis()

print ('okey')



    
