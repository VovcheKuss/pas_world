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
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
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
  butfors: string;
procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  LengPass.Caption:=inttostr(trackBar1.Position);
  pasPower:=trackBar1.Position;
  butfCreate(pasPower);
    Label5.Caption:=butfors;
     case pasPower of
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
function isThere(a:array of Integer; n : Integer; x : Integer) : Boolean;
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
  n, i, temp: Integer;
  arr: Array of Integer;
  str: String;
  bool : Boolean;
begin
    Form1.Edit1.Clear;
    n:=Form1.TrackBar1.Position ; //довжина пароля
    SetLength(arr, n+1);
    Randomize;
    for i :=  1 to n do begin
       bool:=true;
       while (bool = true) do begin
        temp := Random(75) + 48; //   Random(b-a+1) + a;    ---ASCII ( 48-122)
        bool := isThere(arr, i, temp); //перевірка чи вже була цифра раніше
        if (bool = False) then
        begin
          arr[i] := temp;
          str := Form1.Edit1.Text;
        end;
       end;
      Form1.Edit1.Text:= str + Chr(temp);
      end;
  end;

procedure TForm1.butfCreate(passLength:integer);
var qall, alff:integer;
   ope, loctt,akk,agk,akc,alo,adis:double;
   opers, loc1, tlo1, dis1, kcomp,gkvan, kitkvant:string;
begin
    qall:= passLength*4;
    alff:=74;
    ope:=exp(passLength*ln(alff));
    opers:=FloatToStr(ope);
    loctt:=ope/3520000000;

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
      akc:= (loctt/31536000)/10500;
     kcomp:=FloatToStrf(akc,ffFixed,0,3);
     agk:= ((loctt/31536000)/10500)/315360000;
     gkvan:=FloatToStrf(agk,ffFixed,0,3);
     akk:= ((((loctt/31536000)/10500)/315360000)/100000000000000);
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


