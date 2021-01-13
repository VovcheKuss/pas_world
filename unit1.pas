unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckA_Z0_9: TCheckBox;
    CheckSimb: TCheckBox;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LengPass: TLabel;
    Memo1: TMemo;
    MinusLenghtPass: TButton;
    Panel1: TPanel;
    PlusLenghtPass: TButton;
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckA_Z0_9Change(Sender: TObject);
    procedure CheckSimbChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MinusLenghtPassClick(Sender: TObject);
    procedure PlusLenghtPassClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure passCreate();
    procedure butfCreate(passLength:integer);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var pasPower:integer;
  butfors: string; //орієнтовний час злому пароля, методом підбору, без osint бібліотек, неточна інформація
procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  LengPass.Caption:=inttostr(trackBar1.Position);
  pasPower:=trackBar1.Position;
  butfCreate(pasPower);
    Label5.Caption:=butfors;
     case pasPower of  //картинка візуалізації потужності пароля
  4: begin  Label2.Caption:='Дуже ненадійний'; ImageList1.GetBitmap(0, Image2.Picture.Bitmap);   end;
  5:  begin Label2.Caption:='Слабкий';  ImageList1.GetBitmap(1, Image2.Picture.Bitmap);    end;
  8: begin Label2.Caption:='Слабкий';  ImageList1.GetBitmap(1, Image2.Picture.Bitmap);   end;
  9:  begin  Label2.Caption:='Нормальний';  ImageList1.GetBitmap(2, Image2.Picture.Bitmap);  end;
  14: begin  Label2.Caption:='Нормальний';  ImageList1.GetBitmap(2, Image2.Picture.Bitmap);  end;
  15:  begin  Label2.Caption:='Надійний'; ImageList1.GetBitmap(3, Image2.Picture.Bitmap);   end;
  24: begin  Label2.Caption:='Надійний'; ImageList1.GetBitmap(3, Image2.Picture.Bitmap);    end;
  25: begin  Label2.Caption:='Дуже потужний'; ImageList1.GetBitmap(4, Image2.Picture.Bitmap);  end
       end;
     passCreate;
end;

procedure TForm1.MinusLenghtPassClick(Sender: TObject);
begin
  trackBar1.Position:=trackBar1.Position-1;
   butfCreate(pasPower);
   Label5.Caption:=butfors;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.text:=Memo1.Text+'  '+Edit1.Text;
   passCreate;
end;

procedure TForm1.Button2Click(Sender: TObject);       //restsrt-pasword-gen
begin
   passCreate;
    Label5.Caption:=butfors;
end;

procedure TForm1.CheckA_Z0_9Change(Sender: TObject);
begin
 butfCreate(pasPower);
passCreate;
end;

procedure TForm1.CheckSimbChange(Sender: TObject);
begin
  butfCreate(pasPower);
passCreate;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
 passCreate;
  Label5.Caption:=butfors;
end;


procedure TForm1.PlusLenghtPassClick(Sender: TObject);
begin
  trackBar1.Position:=trackBar1.Position+1;
    butfCreate(pasPower);
   Label5.Caption:=butfors;
end;

//-----------------------------------------------------------------------------------------------
function isThere(a:array of Integer; n : Integer; x : Integer) : Boolean; //процедура для створення рандомних і неповторюваних чисел
var
  i : Integer;
  b : Boolean;
begin
  for i:= 1 to n do
   if a[i] = x then begin b:= true; Break; end else  b:= false;
  Result := b;
end;

procedure TForm1.passCreate();
var
  a, b, n : Integer;
  i, temp: Integer;
  arr: Array of Integer;
  str, bukv: String;
  bool : Boolean;

begin
  Form1.Edit1.Clear;

  if CheckA_Z0_9.Checked=true  and   CheckSimb.Checked=false   then begin a:=1;  b:=62; end;
  if CheckA_Z0_9.Checked=true  and   CheckSimb.Checked=true   then begin a:=1;  b:=80; end;
  if CheckA_Z0_9.Checked=false  and   CheckSimb.Checked=true   then begin b:=80;  a:=62; end ;

  n:=Form1.TrackBar1.Position ; //довжина пароля
  if (( a<b )and(n<=(b-a)+1)) then begin
    SetLength(arr, n+1);
    Randomize;
    for i :=  1 to n do begin
     bool:=true;
     while (bool = true) do begin
      temp := Random(b-a+1) + a;
      bool := isThere(arr, i, temp); //перевірка чи вже була цифра раніше

      if (bool = False) then
      begin
        arr[i] := temp;
        case  temp of
          1 :   bukv:= 'z';
          2 :   bukv:= 'y';
          3 :   bukv:= 'x';
          4:    bukv:= 'w';
          5:    bukv:= 'v';
          6:    bukv:= 'u';
          7:    bukv:= 't';
          8:    bukv:= 's';
          9:    bukv:= 'r';
          10:   bukv:= 'q';
          11:   bukv:= 'p';
          12:   bukv:= 'o';
          13:   bukv:= 'n';
          14:   bukv:= 'm';
          15:   bukv:= 'l';
          16:   bukv:= 'k';
          17:   bukv:= 'j';
          18:   bukv:= 'i';
          19:   bukv:= 'h';
          20:   bukv:= 'g';
          21:   bukv:= 'f';
          22:   bukv:= 'e';
          23:   bukv:= 'd';
          24:   bukv:= 'c';
          25:   bukv:= 'b';
          26:   bukv:= 'a';
          27:   bukv:= '0';
          28:   bukv:= '1';
          29:   bukv:= '2';
          30:   bukv:= '3';
          31:   bukv:= '4';
          32:   bukv:= '5';
          33:   bukv:= '6';
          34:   bukv:= '7';
          35:   bukv:= '8';
          36:   bukv:= '9';
          37:   bukv:= 'A';
          38:   bukv:= 'B';
          39:   bukv:= 'C';
          40:   bukv:= 'D';
          41:   bukv:= 'E';
          42:   bukv:= 'F';
          43:   bukv:= 'G';
          44:   bukv:= 'H';
          45:   bukv:= 'I';
          46:   bukv:= 'J';
          47:   bukv:= 'K';
          48:   bukv:= 'L';
          49:   bukv:= 'M';
          50:   bukv:= 'N';
          51:   bukv:= 'O';
          52:   bukv:= 'P';
          53:   bukv:= 'Q';
          54:   bukv:= 'R';
          55:   bukv:= 'S';
          56:   bukv:= 'T';
          57:   bukv:= 'U';
          58:   bukv:= 'V';
          59:   bukv:= 'W';
          60:   bukv:= 'X';
          61:   bukv:= 'Y';
          62:   bukv:= 'Z';
          63:   bukv:= '!';
          64:   bukv:= '@';
          65:   bukv:= '#';
          66:   bukv:= '$';
          67:   bukv:= '%';
          68:   bukv:= '^';
          69:   bukv:= '&';
          70:   bukv:= '*';
          71:   bukv:= '(';
          72:   bukv:= ')';
          73:   bukv:= '_';
          74:   bukv:= '+';
          75:   bukv:= '=';
          76:   bukv:= '-';
          77:   bukv:= '№';
          78:   bukv:= ';';
          79:   bukv:= ':';
          80:   bukv:= '?';        end;
        str := Form1.Edit1.Text;
      end;
     end;
    Form1.Edit1.Text:= str + bukv;

    end;
  end else ShowMessage('Error! Одна з умов не виконується!');
end;

procedure TForm1.butfCreate(passLength:integer);
var qall, alff:integer;
   ope, loctt,akk,agk,akc,alo,adis:double;
   opers, loc1, tlo1, dis1, kcomp,gkvan, kitkvant:string;
begin
  if CheckA_Z0_9.Checked=true  and   CheckSimb.Checked=true   then begin      // букви, цифри  і спецзнаки
    qall:= passLength*4;
    alff:=80; // кількість унікальних букв і цифр  зі спецзнаками
     end;
 if CheckA_Z0_9.Checked=true  and   CheckSimb.Checked=false   then begin             //просто букви і цифри
    qall:= passLength*3;
    alff:=62;   // кількість унікальних букв без спецзнаків
    end;
    ope:=exp(passLength*ln(alff)); // (кількість перестановок=довжина алфавіту), (варіанти=довжина пароля)   довжина пароля^алфавіт
    opers:=FloatToStr(ope);
    loctt:=ope/3520000000;  //0.352 tFlops --4 core AMD Phenom 9500  ---------------дані взяті з вікіпедії

     if  (loctt<=60)  then  begin
     loc1:=FloatToStr(loctt);
     dis1:=FloatToStr(loctt*957);
     tlo1:='секунд'
    end ;
      if  (loctt>60) and (loctt<=3600) then  begin
     loc1:=FloatToStr(loctt/60);
     dis1:=FloatToStr((loctt/3600)*1021);
     tlo1:='хвилин'
    end ;
    if  (loctt> 3600) and (loctt<=86400)  then  begin
   loc1:=FloatToStr(loctt/3600);
   dis1:=FloatToStr((loctt/3600)*1019);
     tlo1:='годин'
    end ;
    if  (loctt> 86400) and (loctt<=31536000)  then  begin
   loc1:=FloatToStr(loctt/86400);
   dis1:=FloatToStr((loctt/86400)*1023);
     tlo1:='днів'
    end ;
    if  (loctt>31536000)   then  begin
     alo:=loctt/31536000;
   loc1:=FloatToStrf(alo,ffFixed,0,3);
   adis:=(loctt/31536000)*1021;
   dis1:=FloatToStrf(adis,ffFixed,0,3); 
      akc:= (loctt/31536000)/10500;            //K Computer~ 11k * AMD Phenom 9500
     kcomp:=FloatToStrf(akc,ffFixed,0,3);
     agk:= ((loctt/31536000)/10500)/315360000;  //GOOGLE quantum computer ~ performs the work in 1 second, the K Computer in a year. 315 360 000 секунд в році  
     gkvan:=FloatToStrf(agk,ffFixed,0,3);
     akk:= ((((loctt/31536000)/10500)/315360000)/100000000000000); //China quantum computer ~ 100 trillion times faster than GOOGLE quantum computer
     kitkvant:=FloatToStrf(akk,ffFixed,0,3);
     tlo1:='років'
    end ;
butfors:='Якість пароля складає '+inttostr(qall)+' одиниці.'+#13+#13+ ' Для підбирання пароля необхідно зробити максимум '
   +opers+' операцій.'+#13+
          'Пароль гарантовано бутфорситься за '+loc1+' '+tlo1+' локально(4 core AMD Phenom 9500).'+#13+
          'Пароль гарантовано підбирається за '+dis1+' '+tlo1+' при віддаленому підключенні.'+#13
          +'K Computer~ '+kcomp+' '+tlo1+#13
          +'GOOGLE KVANT~ '+gkvan+' '+tlo1+#13
          +'China PRIME KVANT~ '+kitkvant+' '+tlo1      +#13+#13+
       'Рекомендуємо:'+#13+'Для віддаленого підключення використовувати паролі якістю вище 30 одиниць,'+#13
       +' при локальному підключенні паролі якістю вище 40 одиниць.'  ;

end;

end.


